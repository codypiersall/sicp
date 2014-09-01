; Exercise 1.21.  Use the smallest-divisor procedure to find the smallest
; divisor of each of the following numbers: 199, 1999, 19999.

(define (square x) (* x x))

(define (smallest-divisor n)
    (find-divisor n 2))
(define (divides? a b)
    (= (remainder b a) 0))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
                  ((divides? test-divisor n) test-divisor)
                          (else (find-divisor n (+ test-divisor 1)))))

(define (print-smallest x)
  (printf "(smallest-divisor ~a) == ~a\n" x (smallest-divisor x)))
(print-smallest 199) ; 199
(print-smallest 1999) ; 1999
(print-smallest 19999) ; 7
