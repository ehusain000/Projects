



;Generalized Sigma: Sigma of any functions.


;Design Idea:

; evaluating term does not change a or b.
; but since our functions have no side effects
; we can gurantee it.

; term looks for a function constrained by [a,b].
; [a,b] has to be numbers to sense for term.

; term needs to make sense for + (sigma)

; the values term(i) must all be defined

; (term i) needs to terminate for each i in
; [a, b]. otherwise we can not gurantee the
; termination of generalized-sigma.

; Termination arguement requires that term(i)
; returns a value for i in [a,b]


; Defining different functions for term

; following funcations has the required
; properties for term

; (gap (next a), b) < gap (a,b)



; Pre Condition: a and b are integers for each
; a <= i <= b term(i) is compitable with +

; Post Condition: returns the sigma of
; term i from i = a to b

; code
(define (generalized-sigma a term b next)
  (cond ((> a b) 0)
        (else (+ (term a)
                 (generalized-sigma (next a)
                                    term
                                    b
                                    next)))))



; for i
(define just-x (lambda (x) x))

; for i^2
(define (square x)
  (* x x))

; for i^3
(define (cube x)
  (* x (square x)))

; for i+1
(define add-1
  (lambda (x)
  (+ x 1)))

; for i+2
(define add-2
  (lambda (x)
  (+ x 2)))


; testing generalized-sigma
(generalized-sigma 1 just-x 100 add-1)
(generalized-sigma 1 square 100 add-2)
(generalized-sigma 1 cube 100 add-1)
(generalized-sigma 1 add-2 100 add-2)

; Proof(s)
; A proof by induction on gap(a,b)

;             a+1
; |------------|--------|
; a                     b
; |-------gap(a,b)------|

; where gap(a,b) = 0 if a > b
;                = b - a otherwise

; Induction Hypothesis: Given the pre condition
; the recursive call works correctly and the
; (generalized-sigma (+ a 1) term b) correctly
; computes the sigma of term(i)


; Termination Condition: 