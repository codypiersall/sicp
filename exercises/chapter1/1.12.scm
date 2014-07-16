; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.

;        1
;       1 1
;      1 2 1
;     1 3 3 1
;    1 4 6 4 1
;   1 5 a a 5 1
;
; (= a 10) #t

; The numbers at the edge of the triangle are all 1, and each number inside the
; triangle is the sum of the two numbers above it. Write a procedure that
; computes elements of Pascal's triangle by means of a recursive process.

; This will give the mth row nth column
(define (pascals row col)
  (cond ((or (> col row) (< col 1)) 0)
        ((or (= row 1) (= col 1) (= col row)) 1)
        (else (+ (pascals (- row 1) (- col 1))
                 (pascals (- row 1) col)))
  )
)

; let's do a substitution for (pascals 3 2), and make sure it comes out 2.

; (pascals 3 2)
; (cond ((or (> 2 3) (< 2 1)) 0) ; <-- nope
;       ((or (= 3 1) (= 2 1) (= 3 2)) 1) ; <-- nope
;       (else (+ (pascals (- 3 1) (- 2 1))
;                (pascals (- 3 1) 2)))
; )

; becomes

; (+ (pascals (2 1))
;    (pascals (2 2))

; I'm not going to go further, but guess what? It ends up with the right
; answer.
