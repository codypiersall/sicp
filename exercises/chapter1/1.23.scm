; Exercise 1.23.  The smallest-divisor procedure shown at the start of this
; section does lots of needless testing: After it checks to see if the number
; is divisible by 2 there is no point in checking to see if it is divisible by
; any larger even numbers. This suggests that the values used for test-divisor
; should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement
; this change, define a procedure next that returns 3 if its input is equal to
; 2 and otherwise returns its input plus 2. Modify the smallest-divisor
; procedure to use (next test-divisor) instead of (+ test-divisor 1). With
; timed-prime-test incorporating this modified version of smallest-divisor, run
; the test for each of the 12 primes found in exercise 1.22. Since this
; modification halves the number of test steps, you should expect it to run
; about twice as fast. Is this expectation confirmed? If not, what is the
; observed ratio of the speeds of the two algorithms, and how do you explain
; the fact that it is different from 2?

; I *think* this should work out.  Right now, 1.22.scm loads 1.21.scm and uses
; those functions; however, I'm redefining the methods here, so hopefully the
; functions in 1.22.scm will use the functions defined here when called.

(load "1.22.scm")
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
                  ((divides? test-divisor n) test-divisor)
                          (else (find-divisor n (next test-divisor)))))

(define (next x)
  (if (= x 2)
    3
    (+ x 2)))

; running time-the-primes (defined in 1.22.scm) gives new, smaller run times
; for all the prime numbers tested.
;
; For the first three, the time went from 195 ms to  122 ms;
; For the second, the time went from 616 ms to 378 ms;
; For the third, the time went from 1948 ms to 1198 ms
;
; The time doesn't quite go in half, but that's probabby because it takes
; longer to find the next divisor than it used to.
