; Exercise 1.8.  Newton's method for cube roots is based on the fact that if y
; is an approximation to the cube root of x, then a better approximation is
; given by the value

; (x/y**2 + 2*y) / 3

; Use this formula to implement a cube-root procedure analogous to the
; square-root procedure. (In section 1.3.4 we will see how to implement
; Newton's method in general as an abstraction of these square-root and
; cube-root procedures.)

(define (cbrt x)
        (define (good-enough? this-guess last-guess)
                (if (= this-guess last-guess)
                    #t
                    #f
                )
        )

        (define (improve guess)
                (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)
        )

        (define (iterate this-guess last-guess)
              (if (good-enough? this-guess last-guess)
                  this-guess
                  (iterate (improve this-guess) this-guess)
              )
        )

        (iterate 1 0)
)

(define (test x)
        (printf "cbrt of ~a is ~a\n" x (cbrt x))
)
