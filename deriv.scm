(define (deriv f)
  (let ((dx 0.00000001))
    (lambda (x) (/ (- (f (+ x dx)) (f x))
                   dx))))

(define (cube x)
  (* x x x))

((deriv cube) 5)

