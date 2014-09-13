; Exercise 1.31.
; a.  The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures.51 Write an
; analogous procedure called product that returns the product of the values of
; a function at points over a given range. Show how to define factorial in
; terms of product. Also use product to compute approximations to  using the
; formula
;
; pi    2 * 4 * 4 * 6 * 6 * 8 ...
; -- = --------------------------
; 4     3 * 3 * 5 * 5 * 7 * 7 ...
;
; b.  If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

; Write a procedure called product that returns the product of the values of a
; function at points over a given range.
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; Show how to define factorial in terms of product.
(define (inc x) (+ x 1))
(define (factorial n) (product2 identity 1 inc n))

; Also use product to compute approximations to pi using the
; formula
;
; pi    2 * 4 * 4 * 6 * 6 * 8 ...
; -- = --------------------------
; 4     3 * 3 * 5 * 5 * 7 * 7 ...
(define (even x) (= 0 (modulo x 2)))
(define (pi n)
  (define (numerator)
    (define (numterm k)
      (if (even k)
          (+ k 2)
          (+ k 3)))
    (product2 numterm 0 inc (- n 1)))
  (define (denominator)
    (define (denterm k)
      (if (even k)
        (+ k 3)
        (+ k 2)))
    (product2 denterm 0 inc (- n 1)))
  (* 4 (/ (numerator) (denominator))))

; iterative
(define (product2 term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (* (term x) result))))
  (iter a 1))


