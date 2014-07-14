; Exercise 1.10.  The following procedure computes a mathematical function
; called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

(A 1 10)

; (A (- 1 1) (A 1 (- 10 1)))
; (A 0 (A 1 9))
; (* 2 (A 1 9))
; (* 2 (A 0 (A 1 8)))
; (* 2 (* 2 (A 1 8)))

; eventually, just becomes (expt 2 y)
(A 2 4)

; (A (- 2 1) (A 2 (- 4 1)))
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
;
; (expt 2 (expt 2 (expt 2 2)))
; (expt 2 (expt 2 4))
; (expt 2 16)
; 65536
; Boom!!!

(A 3 3)
; (A 2 (A 3 2))
; (expt 2 (expt 2 (A 2 (A 3 1))))
; (expt 2 (expt 2 (A 2 2)))
; (expt 2 (expt 2 (expt 2 2)))
(expt 2 (expt 2 3))

;Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))
; f returns (* 2 n)

(define (g n) (A 1 n))
; g returns (expt 2 n)

(define (h n) (A 2 n))
; h returns (expt 2 (expt 2 (expt 2 ... 2)))
; raises 2 to the 2 to the 2, n times.
; (h 1) == 2
; (h 2) == 2^2
; (h 3) == (2^(2^2))
; (h 4) == (2^(2^(2^2)))
;
; and so on.

(define (k n) (* 5 n n))
; Returns 5 * n^2
; Give concise mathematical definitions for the functions computed by the
; procedures f, g, and h for positive integer values of n. For example, (k n)
; computes 5n2.
