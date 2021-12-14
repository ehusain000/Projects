(define (newcons x y)
  (lambda (m) (m x y)))

(define (newcar z)
  (z (lambda (p q) p)))

(define (newcdr z)
  (z (lambda (p q) q)))

(define z (newcons 1 (list 2 3 4)))

(newcar z)
(newcdr z)