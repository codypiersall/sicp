; Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a
; procedure that generates an iterative process for multiplying two integers in
; terms of adding, doubling, and halving and uses a logarithmic number of
; steps.

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (mult-iter x y addend)
  (cond ((= y 1) (+ x addend))
        ((even? y) (mult-iter (double x) (halve y) addend))
        (else (mult-iter x (- y 1) (+ addend x)))
  )
)

(define (mult x y)
 (mult-iter x y 0)
)
