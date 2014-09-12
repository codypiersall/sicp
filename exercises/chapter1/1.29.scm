; Exercise 1.29.  Simpson's Rule is a more accurate method of numerical
; integration than the method illustrated above. Using Simpson's Rule, the
; integral of a function f between a and b is approximated as
;
;
;
; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing
; n increases the accuracy of the approximation.) Define a procedure that takes
; as arguments f, a, b, and n and returns the value of the integral, computed
; using Simpson's Rule. Use your procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to those of the integral
; procedure shown above.
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (int f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (term k)
    (cond ((= k 0) (yk k))
          ((= k n) (yk k))
          ((= 0 (modulo k 2)) (* 2 (yk k)))
          (else (* 4 (yk k)))))

  (* (/ h 3) (sum term 0 inc n)))
