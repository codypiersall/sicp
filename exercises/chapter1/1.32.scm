; Exercise 1.32.  a. Show that sum and product (exercise 1.31) are both special
; cases of a still more general notion called accumulate that combines a
; collection of terms, using some general accumulation function:
;
; (accumulate combiner null-value term a next b)
;
; Accumulate takes as arguments the same term and range specifications as sum
; and product, together with a combiner procedure (of two arguments) that
; specifies how the current term is to be combined with the accumulation of the
; preceding terms and a null-value that specifies what base value to use when
; the terms run out. Write accumulate and show how sum and product can both be
; defined as simple calls to accumulate.
;
; b. If your accumulate procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

; the recursive sum procedure is shown below
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; and the recursive product procedure:

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; It's clear from looking at these that there are two differences: when a is
; greater than b, the value differs. That would be what needs to be passed in
; as `null-value`. The other difference is the operator that is applied in the
; else part of the condition; that needs to be passed in as the combiner.
; Let's wrap it all together:

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

; Now we can define both sum and product in terms of this procedure:

(define (sum term a next b) (accumulate + 0 term a next b))
(define (product term a next b) (accumulate * 1 term a next b))

; Now to make an iterative process.
(define (accumulate combiner null-value term a next b)
  (define (iter k total)
    (if (> k b)
      total
      (iter (next k)
            (combiner total (term k)))))
  (iter a null-value))

