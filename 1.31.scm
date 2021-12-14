
(define identity
  (lambda (x) x))

(define square
  (lambda (x) (* x x)))

(define cube
  (lambda (x) (* x (square x))))

(define inc
  (lambda (x) (+ x 1)))


(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(product cube 1 inc 10)
(product-iter cube 1 inc 10)
