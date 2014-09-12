; Exercise 1.30.  The sum procedure above generates a linear recursion. The
; procedure can be rewritten so that the sum is performed iteratively. Show how
; to do this by filling in the missing expressions in the following definition:
;
; (define (sum term a next b)
;   (define (iter a result)
;       (if <??>
;           <??>
;           (iter <??> <??>)))
;   (iter <??> <??>))

; load 1.29.scm so that this version of sum will override the version in 1.29.
; That way this can be tested easily on import.
(load "1.29.scm")
(define (sum term a next b)
  (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (+ result (term a)))))
  (iter a 0))

