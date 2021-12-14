

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define square
  (lambda (x) (* x x)))

(define cube
  (lambda (x) (* x (square x))))

(define inc
  (lambda (x) (+ x 1)))

; sum of term from a to b using next to decrease the gap between a to b
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(sum cube 1 inc 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (integral f a dx b)
  (define add-dx
    (lambda (x) (+ x dx)));next
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(integral cube 0 0.01 1)
;.24998750000000042
(integral cube 0 0.001 1)
;.249999875000001



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x)(+ x 1))
  (define (y k)(f (+ a (* k h))))
  (define (term k)
    (* (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          ((even? k) 2))
       (y k)))
  (/ (* h (sum term 0 inc n)) 3))



  
(newline)
(integral cube 0 0.01 1)
;.24998750000000042
(simpson cube 0 1 100.0)
;0.24999999999999992

(integral cube 0 0.001 1)
;.249999875000001
(simpson cube 0 1 1000.0)
;0.2500000000000003


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;