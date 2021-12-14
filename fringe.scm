(define tree (cons '(1 2) '(3 4)))
(define null-tree '())

(define (atom? x)
  (and (not (null? x)) (not (pair? x))))

(define (fringe tree)
  (cond ((null? tree) tree)
        ((atom? tree) (list tree))
        (else (append (fringe (car tree))
                      (fringe (cdr tree))))))

(fringe tree)
(fringe null-tree)




(define (my-append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (my-append (cdr l1) l2))))

(my-append '() 'arafat)

(my-append '(1 2) '(3 4))