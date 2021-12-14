(define (my-enumurate low high)
  (if (> low high)
      '()
      (cons low (my-enumurate (+ low 1) high))))

(my-enumurate 1 50)


(define (my-tree-enumurate tree)
  (cond ((null? tree) '())
        ((atom? tree) (list tree))
        (else (append (my-tree-enumurate (car tree))
                      (my-tree-enumurate (cdr tree))))))

(define (atom? x)
  (and (not (null? x)) (not (pair? x))))

(my-tree-enumurate '(1 2 (3) 4 (5) 6))
