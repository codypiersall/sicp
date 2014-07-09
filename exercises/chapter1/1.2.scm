;;;
; translate the following expression into prefix form
; 5 + 4 + (2 - (3 - (6 + 4/3)))
; -----------------------------
;       3(6 - 2)(2 - 7)
;;;

; Scheme style:
;
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 3))))) 
 (* 3 (- 6 2) (- 2 7)))

; simplifying numerator:
; 9 + (2 - (3 - (22/3))) 
; 9 + 2 - 3 + 22/3
; 8 + 22/3
; 46/3
; Boom!  46/3 for numerator.

; denominator:
; 3 * 4 * (-5)
; -60

; putting it together:
; -(46/3)/60
; 46 / 180
; 23 / 90 == .255555555

