;Haskell Curry: logician

;curried form of sigma
;partial evaluation

(define (curried-sigma term)
  (define (sum-term a b)
    (cond ((> a b) 0)
          (else (+ (term a) (sum-term (+ a 1) b)))))
  sum-term;body of function curried-sigma
  )


(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))


((curried-sigma (lambda(x) x)) 1 10)

((curried-sigma square) 1 10)

((curried-sigma cube) 1 10)


;
;(define (curried-sigma2 a b)
;  (define (sum-from-a b)
;    (cond ((> a b)0)
;          (else (+ (curried-sigma2))))
;  (sum-from-a b))

;^ hw



