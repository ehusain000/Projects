;pre: inputs, lst - is a list (l1, l2, l3, ..., lk)
; of lists, each of which has the same length and
; consists of only atoms. Let's say that
; li = (a_i1 a_i2 ... a_in)

;l2 = (a_21 a_22 a_23 ... a_2n)

;post: the list (a_11 a_21 ... a_k1) to be the returned value


;Design Idea:
; cdr down each element and cons the car of each sublist
; onto the result

; we assume that the recursive call returns a list
; consisting the first elements of the first element of
; of (cdr lst). what
; do we do with the result of this call? As above, we
; can (cons (caar lst) result-of-the-recursive call)

;this will return a list (consing into a list given a list)
; ..., so looking good


;The stopping case: 

(define (first l)
  (cond ((null? l) '())
        (else (cons (caar l)
                    (first (cdr l))))))

(first '((a b) (c d f) (e f)))
  