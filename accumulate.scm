(define (accumulate operator initial sequence)
  (cond ((null? sequence)initial)
        (else (operator (car sequence) (accumulate operator initial (cdr sequence))))))

(accumulate + 0 '(0 1 2 3 4))
(accumulate * 1 '(1 2 3 4))
(accumulate / 1 '(1 2 3 4))

;folding right <-
;'(0 1 2 3 4) <-


;defining map using accumulate(foldright)

(define (my-map f l)
  (accumulate (lambda (x y) (cons (f x) y)) '() l))

(define (square x)
  (* x x))
(define l1 '(1 2 3 4))

(my-map square l1)