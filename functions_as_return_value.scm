(define my-sq
  (lambda (x) (* x x)))

(my-sq 2)


(define cube
  (lambda (x) (* x (my-sq x))))
;return value: value



(cube 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define add-constant
  (lambda (x) (lambda (anything) (+  anything x))))

((add-constant 5) 2)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;curring: one arguement fucntions
; the argument has to be a funtion



(define (sq x)
  (* x x))

(define (cube x)
  (* x (sq x)))


(define just-x
  (lambda (x) x))




(define (curried-sigma term)
  (define (sum-term a b)
    (cond ((> a b) 0)
          (else (+ (term a) (sum-term (+ a 1) b)))))
  sum-term)



(newline)
;testing
((curried-sigma just-x) 1 10)
((curried-sigma sq) 1 10)
((curried-sigma cube) 1 10)

























