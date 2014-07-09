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

(define (test_ex1_3 x) 
    ; testing is hard in Scheme.
    ((define expected 13)
    (if (not (= expected (ex1_3 1 2 3)))
        (display "F"))
    (if (not (= expected (ex1_3 3 2 1)))
        (display "F"))
    (if (not (= expected (ex1_3 2 1 3)))
        (display "F"))
    )
)