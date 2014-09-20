; Problem statement
; =================

; Exercise 1.33.  You can obtain an even more general version of accumulate
; (exercise 1.32) by introducing the notion of a filter on the terms to be
; combined. That is, combine only those terms derived from values in the range
; that satisfy a specified condition. The resulting filtered-accumulate
; abstraction takes the same arguments as accumulate, together with an
; additional predicate of one argument that specifies the filter. Write
; filtered-accumulate as a procedure. Show how to express the following using
; filtered-accumulate:

; a. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)

; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

; Solution
; ========

; Part 1
; ------

; Write filtered-accumulate as a procedure.

(define (filtered-accumulate condition? combiner null-value term a next b)
  (if (> a b)
    null-value
    (define next-val
      (if (condition? a)
        (term a)
        null-value))
      (combiner next-val
        (accumulate combiner null-value term (next a) next b))))

; a. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)

(define (sum-of-primes a b) (filtered-accumulate prime? + 0 identity a inc b))

; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (product-relative n) (filtered-accumulate rel-prime * 1 identity 1 inc n))

; where rel-prime is defined as

(define (rel-prime i n) (= 1 (GCD i n)))
