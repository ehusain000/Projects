;some common tools
(define (sq x)
  (* x x))

(define l1 '(1 2 3 4))

(define (atom? x)
  (and (not (null? x)) (not (pair? x))))



;map
;1)
;Pre: takes a function and a list of atoms
;post: applies the function to each atom of the list and return the list

;2)
;design Idea: map essentially takes the first atom and applies f to it it
;(car list) is an atom and apply f to (car l)
;and cdr down the list and stop when l is an empty list
; we take cons as our guard

;3)code
(define (my-map f l)
  (if (null? l)
      l
      (cons (f (car l)) (my-map f (cdr l)))))

;4)testing
(my-map sq l1)


;filter

;1)
;pre: takes a boolean function, predicate and a list of atoms, sequence
;post: returns a list with elements according to the predicate

;2)Design Idea
;if the (predicate (car sequence)) is evaluated to be #t, cons the (car sequence) to the recursive call
;when sequence is empty return the sequence.

;3) code
(define (my-filter predicate sequence)
  (cond ((null? sequence) sequence)
    ((predicate (car sequence))
        (cons (car sequence) (my-filter predicate (cdr sequence))))
       (else (my-filter predicate (cdr sequence)))))

;4) testing
(my-filter odd? l1)

;5) Proofs

;Termination Arguement
;sequence starts as some arbitary list of atoms and after cdring down at each recusive call,
; sequence eventually becomes the empty list which evaluated by the recusive call
;the program terminates.



(define (my-accumulate operator initial sequence)
  (if (null? sequence)
      initial
      (operator (car sequence) (my-accumulate operator initial (cdr sequence)))))

(my-accumulate + 0 l1)
(my-accumulate cons '() l1)


;'(1 2 3 4 5 6 7)

(define (my-map2 f l)
  (my-accumulate (lambda (x y) (cons (f x) y)) '() l))
;(cons (f x) y) = (cons (f (car l)) (my-accumulate operator initial (cdr sequence))

(my-map2 sq l1)


(define (leftmost l)
  (my-accumulate (lambda (x y) x) '() l))

(leftmost l1)



(define (foldr operator initial sequence)
  (if (null? sequence)
      initial
      (operator (car sequence) (foldr operator initial (cdr sequence)))))

(foldr + 0 l1)
(foldr cons '() l1)

(define (left-most l)
  (foldr (lambda (x y) x) '() l))


(left-most l1)

(define (fold-left operator initial sequence)
  (define (iter result unprocessed-list)
    (if (null? unprocessed-list)
        result
        (iter (operator (car unprocessed-list) result)
                    (cdr unprocessed-list))))
  (iter initial sequence))

;4)testing
(fold-left cons '() l1)
(fold-left + 0 l1)



(define (elem e l)
  (fold-left (lambda (acc first) (or acc (eq? first e)))
             #f
             l))

(display"elem")
(elem 3 l1)

(define (elem e l)
  (fold-left
   (lambda (acc first) (or acc (eq? first e)))
   #f
   l))

(elem 3 '(1 2 3 4 5))


(define (count-nodes tree)
  (cond ((null? tree) 0)
        ((atom? tree) 1)
        (else (+ 1 (foldr + 0 (map count-nodes tree))))))

(count-nodes '((1)((2 3))(4 5)))


(define (count-par tree)
  (cond ((null? tree) 2)
        ((atom? tree) 0)
        (else (+ 2 (foldr + 0 (map count-par tree))))))

(count-par '((1)((2 3))(4 5)()))
(count-par '((1)((2 3))(4 5)()))

(count-par '(((a () b) c) () ((d) e)) ) ;= 14
