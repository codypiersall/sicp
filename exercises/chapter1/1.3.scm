; Exercise 1.3.  
; Define a procedure that takes three numbers as arguments and returns 
; the sum of the squares of the two larger numbers.
(define (square x) (* x x))

(define (sumsquares x y)
    (+ (square x) (square y))
)

(define (ex1_3 num1 num2 num3)
    (cond 
        ((and (<= num1 num2) (<= num1 num3)) (sumsquares num2 num3))
        ((and (<= num2 num1) (<= num2 num3)) (sumsquares num1 num3))
        (else (sumsquares num1 num2))
    )
)