; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that
; computes f by means of a recursive process. Write a procedure that computes f
; by means of an iterative process.

; The recursive process is easy; just translate the definition into Scheme.
; Not a problem.
(define (rec-f n)
  (if (< n 3)
      n
      (+ (rec-f (- n 1))
         (* 2 (rec-f (- n 2)))
         (* 3 (rec-f (- n 3)))
      )
  )
)

; Iterating is a lot trickier.  Let's write down the first few values to get a
; feel for the pattern.
;
; 0 1 2 4 11 25
;
; Actually, just writing the first couple out, I realized that I have to keep
; track of only the last three numbers in the sequence.  Those fully define the
; state of the program.
;
; we should be able to tell how

(define (iter-f a)
  (define (iterate n-3 n-2 n-1 count)
    (define this-one (+ n-1
                        (* 2 n-2)
                        (* 3 n-3))
    )
    (if (= count a)
        this-one
        (iterate n-2 n-1 this-one (+ count 1))
    )
  )
  (if (< a 3)
      a
      (iterate 0 1 2 3)
  )
)
