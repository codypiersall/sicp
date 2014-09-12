; Exercise 1.24.  Modify the timed-prime-test procedure of exercise 1.22 to use
; fast-prime? (the Fermat method), and test each of the 12 primes you found in
; that exercise. Since the Fermat test has (log n) growth, how would you expect
; the time to test primes near 1,000,000 to compare with the time needed to
; test primes near 1000? Do your data bear this out? Can you explain any
; discrepancy you find?

(load "1.22.scm")
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
    (define (try-it a)
          (= (expmod a n n) a))
      (try-it (+ 1 (random (- n 1)))))

(define (prime? x) (fast-prime? x (inexact->exact (floor (log x)))))
