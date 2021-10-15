;Problem: Use the equation (x+1)^2 = x^2 + 2*x*1 + b^2 to
; develope a recursive program for computing squares which
; does not use multiplication. 


;Recursive solution
;Design idea: How can we put this problem into a form
; that looks like a recursive formula.

; one idea is to substitude (x-1) for x which gives us
; x^2 = (x - 1)^2 + 2 (x-1) + 1

;pre condition: input x is non negative integer
;post: condition: function returns sqaures of x

(define (squares x)
  (cond ((zero? x) 0)
        (else (+ (squares (- x 1))
                 (- x 1)
                 (- x 1)
                 1))))

; IH: correctly computes (sqaures (- x 1))
;

;testing
(squares 5)
(squares 0)
(squares 25)


;Proof(s)
; A proof by induction on x

;Basis case: x=0 when x is equal to 0, the program returns 0 since squares of 0 is 0 by definition, this is true

;IH: Assume the recursive call to (squares (- x 1)) works that is (sqaures (- x 1)) properly computes the squares of
;(x-1)

;IS: we have to show that the recursive call works for (squares x)
;for the call to (sqaures x) we get:
; (+ (sqaures (- x 1))
;    (- x 1)
;    (- x 1)
;    1)
;By the IH we know that recursive call to (sqaures (- x 1)) properly computes. so for call to
; (sqaures x), it will compute as well and return a value.

;Termination Argument: (sqaures x) takes in a non negative integer x and at each recursive call decreases by
; 1 which means that x will eventually decrease to 0 which will then terminate the program.

