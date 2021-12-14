;1)
;pre: inputs an s expression
;post: reverses all the sub expressions of the s expression

;2) Design Idea:

;Design roles:

;helper function: iter -- takes two argument result and s

;s: an expression
;at each call to iter s becomes (cdr s)

;result:
;result list with elements reversed so far
;at each to iter we ask if the car of s is atom
; if an atom we simply cons the car of s to result so far.
;otherwise if car of s is not atom we deep reverse that subexpression
;until we reach an atom


;another helper function: reverse-elemements -- takes an element, e
;asks whether e is atom or not. if atom returns e other wise
; calls deep-reverse on e which will cdr down until e is an atom 


; if the s expression is empty, then we have nothing to do
; just return

;3)code
(define (deep-reverse s)
  
   (define (reverse-elements e) 
     (if (not (pair? e)) 
         e 
         (deep-reverse e)))
  
   (define (iter result s) 
     (if (null? s) 
         result 
         (iter (cons (reverse-elements (car s)) 
                             result)
               (cdr s))))
  
   (iter '() s))

 ;4) testing: 
(deep-reverse (list (list 1 2) (list 3 4)))
(deep-reverse '((key is) consistency))

;5)
;Termination: we cdr down s while reversing the car of s and eventually we
;s becomes empty which terminate the program and returns the result
