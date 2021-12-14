(define (gen-sigma-new a term b next)
  (cond ((> a b) 0)
        (else (+ (term a)
                 (gen-sigma-new (next a)
                                term
                                b
                                next)))))
(define (squares x)
  (* x x))

(define (cube x)
  (* x (squares x)))

(define (add-2 x)
  (+ x 2))

(gen-sigma-new 1 cube 10 add-2)

;we need pre cond for term and next!
; can arg to term be reals

;gap(next (a) , b) < gap (a,b)

;next reduces the gap after a bounded number of calls



;you can even change the + from
;(+ (term a)
;   (gen-sigma-new (next a)
;                  term
;                  b
;                  next))

;to a general combiner




