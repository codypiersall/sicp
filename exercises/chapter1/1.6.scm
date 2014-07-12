; Exercise 1.6  Alyssa P. Hacker doesn't see why if needs to be provided as
; a special form. ``Why can't I just define it as an ordinary procedure in
; terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can
; indeed be done, and she defines a new versions of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0

(load "sqrt.scm")

; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter-new guess x)
  (display "here")
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new (improve guess x) x)))

; What happens when Alyssa attempts to use this to compute square roots?
; Explain.

; Solution!
; Because new-if is a function, it must evaluate all of its arguments before it
; returns a value.  So it evaluate (good-enough? guess x), guess, AND
; (sqrt-iter-new (improve guess x) x) every time it is called, no matter what.
; Even when it meets the good-enough? criteria, it evaluates both other
; arguments.  And recurses forever.
