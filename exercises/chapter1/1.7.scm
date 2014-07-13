; Exercise 1.7.  The good-enough? test used in computing square roots will not
; be very effective for finding the square roots of very small numbers. Also,
; in real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for small
; and large numbers. An alternative strategy for implementing good-enough? is
; to watch how guess changes from one iteration to the next and to stop when
; the change is a very small fraction of the guess. Design a square-root
; procedure that uses this kind of end test. Does this work better for small
; and large numbers?

(load "sqrt.scm")

(define (test x)
        (printf "sqrt(~a) != ~a\n" x (mysqrt x))
)

(define (test-small)
        (test 1E-18)
)

(define (test-big)
        (test 1.1E200)
)

;(test-small)
; (test-big) ; goes into infinite loop

; (test-small) fails because 1E-4 isn't nearly small enough to get an
; approximately correct answer for 1E-18; the right answer would be 1E-9.
;
; (test-big) goes into an infinite loop because the precision can't ever get
; down to 1E-4 due to floating point limitations.

(define (new-sqrt x)
        (define (good-enough? this-guess last-guess)
                (if (= (abs (- this-guess last-guess)) 0)
                    #t
                    #f
                )
        )

        (define (iterate this-guess last-guess)
                (if (good-enough? this-guess last-guess)
                    this-guess
                    (iterate (improve this-guess x) this-guess)
                )
        )

        (iterate 1 0)
)
