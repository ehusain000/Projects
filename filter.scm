(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define sequence1 '(1 2 3 4 5 6 7 8))

(define (atom? x) (and (not (null? x)) (not (pair? x))))

(filter odd? sequence1)
(filter even? sequence1)
(filter atom? sequence1)