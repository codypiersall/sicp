(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

; Exercise 1.20.  The process that a procedure generates is of course dependent
; on the rules used by the interpreter. As an example, consider the iterative
; gcd procedure given above. Suppose we were to interpret this procedure using
; normal-order evaluation, as discussed in section 1.1.5. (The
; normal-order-evaluation rule for if is described in exercise 1.5.) Using the
; substitution method (for normal order), illustrate the process generated in
; evaluating (gcd 206 40) and indicate the remainder operations that are
; actually performed. How many remainder operations are actually performed in
; the normal-order evaluation of (gcd 206 40)? In the applicative-order
; evaluation?

; Applicative order:
(gcd 206 40)

(gcd 40 (remainder 206 40)) ; (remainder 206 40) == 6
(gcd 40 6)

(gcd 6 (remainder 40 6)) ; (remainder 6 40) == 4
(gcd 6 4)

(gcd 4 (remainder 6 4)) ; (remainder 4 6) == 2
(gcd 4 2)

(gcd 2 (remainder 4 2)) ; (remainder 4 2) == 0
(gcd 2 0) ; -> 2

; For applicative order, remainder is applied 4 times.

;;;;;;;;;;;;;;;;;;;;;

; Normal order
; I'm going to fully expand this and hopefully not regret it.
(gcd 206 40)
(if (= 40 0)
    40
    (gcd 40 (remainder 206 40)))

;;;;;
(gcd 40 (remainder 206 40))
; substituting, we get
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

; We've got to evaluate the one remainder now (= (remainder 204 40))
; (if (= 6 0)
; 40
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

; We've done *1* remainder operation; now we have to plug in some more numbers.

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

; reduces to

(if (= (remainder 40 (remainder 204 40)) 0)
 (remainder 206 40)
 (gcd
  (remainder 40 (remainder 206 40)) ; a
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; b

; we have to do 2 more remainder operations so the branch knows which one to
; take.  (remainder 40 (remainder 204 40)) does not equal 0; keep going.

; 3 remainder operations have been done total now.

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
  (remainder 40 (remainder 206 40))
  (gcd
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; a
    (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    ) ; b
  )
)

; okay, well I'm confused.  Maybe I haven't lost anything yet.

; 4 more remainder operations done in the if statement; still evaluates false.
; 7 total remainder operations done now.
; Lots of stuff to substitiute now.

; Need to reduce this expression:
(gcd
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; a
    (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    ) ; b
  )

(if (=
       (remainder
         (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder
           (remainder 40 (remainder 206 40))
           (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         )
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder
                      (remainder 40 (remainder 206 40))
                      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    ))))

; Honestly I have no idea if I substituted this correctly.  Lots of yanking in
; vim; hopefully it worked out.

; Evaluating the equality expression makes 7 more remainder operations take
; place.  Finally, the equality evaluates to true.  4 more remainder operations
; are done to evaluate the if-true branch.

; In total, 18 remainder operations were made.  It was a terrible time for
; everyone.

; My answer matches Bill the Lizard's, so probably I did it right.
