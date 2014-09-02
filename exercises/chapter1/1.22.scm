; Exercise 1.22.  Most Lisp implementations include a primitive called runtime
; that returns an integer that specifies the amount of time the system has been
; running (measured, for example, in microseconds). The following
; timed-prime-test procedure, when called with an integer n, prints n and
; checks to see if n is prime. If n is prime, the procedure prints three
; asterisks followed by the amount of time used in performing the test.

(load "1.21.scm")
(define (prime? x) (= x (smallest-divisor x)))
(define (timed-prime-test n)

    (display n)

    (start-prime-test n (current-milliseconds))
    (display "\n"))
(define (start-prime-test n start-time)
    (if (prime? n)
      (report-prime (- (current-milliseconds) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
    )
; Using this procedure, write a procedure search-for-primes that checks the
; primality of consecutive odd integers in a specified range. Use your
; procedure to find the three smallest primes larger than 1000; larger than
; 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to
; test each prime. Since the testing algorithm has order of growth of sqrt(n), you
; should expect that testing for primes around 10,000 should take about 10
; times as long as testing for primes around 1000. Do your timing data bear
; this out? How well do the data for 100,000 and 1,000,000 support the sqrt(n)
; prediction? Is your result compatible with the notion that programs on your
; machine run in time proportional to the number of steps required for the
; computation?

; Here's the function you asked for, sir.
(define (search-for-primes low high)
  (if (<= low high)
      (begin (timed-prime-test low)
             (search-for-primes (+ low 2) high))))

; there's not enough resolution in (current-milliseconds) to work with the
; inputs suggested.  Let's make the numbers way bigger.

; After some experimentation, the smallest numbers that really give meaningful
; results are on the order of 1E11.

; running this function
; (search-for-primes (+ 1E11 1) (+ 1E11 71))
; reveals that 100000000003, 100000000019, and 100000000063 are the three
; smallest.
;
; (search-for-primes (+ 1E12 1) (+ 1E12 71))
; reveals that 1000000000039, 1000000000061, and 1000000000063 are the next;
;
; (search-for-primes (+ 1E12 1) (+ 1E12 71))
; reveals that 10000000000037, 10000000000051, and 10000000000099 are the last.

; run this to see the results on the three prime numbers
(define (time-the-primes)
  (timed-prime-test (+ 3 1E11))
  (timed-prime-test (+ 19 1E11))
  (timed-prime-test ( + 63 1E11))

  (timed-prime-test (+ 39 1E12))
  (timed-prime-test (+ 61 1E12))
  (timed-prime-test (+ 63 1E12))

  (timed-prime-test (+ 37 1E13))
  (timed-prime-test (+ 51 1E13))
  (timed-prime-test (+ 99 1E13))
)

; running time-the-primes shows that the first three take 195 ms,
; the next three take ~ 616 ms, and the last three take about 1948 ms.
; That means that the algorithm really does run in O(sqrt(n)) time!  Amazing.
