;Recursive solution

;pre: b is a number and n is a non negative integer
;post: returns b^n

;Design Idea:
; to compute exponent of a number b and a non negative integer n
; we take a divide and conquer approach where
; we can take * as guard and at each call we multiply by n by the recursive call
; at each recursive call n decrements by 1
; n eventually reaches 0, when n is equal to 0, b^0 will equal to 1 and program will terminate

;code
(define (my-expt b n)
  (cond ((= 0 n) 1)
        (else (* b (my-expt b (- n 1))))))

;testing
(my-expt 2 2)
(my-expt 10 2)
(my-expt -5 3)

;proof(s)
;an induction on n 

;basis: n=0, when n is 0, (my-expt b 0) computes to 1.
;we know that any number that has exponent 0 is computed to be 1
;so this is true

;IH: assume that the recursive call to(my-expt b (- n 1)) works.
; that means it returns the correct value which is
; b^(n-1)

;IS: we need to show that the recursive call to (my-expt b n) works.
;By IH, we know that the recursive call to (my-expt b (- n 1)) works
;so for (my-expt b n), we have (* b (my-expt b (- n 1))). we multiply
; the recursive call to (my-expt b (- n 1)) with b which return the correct output b^n

;Termination condition: since we are induction on the non-negative integer n,
; we know that at each call n decreaments by 1 and eventually n decreases to 0
;returning 1 to the recursive call, which halts the program giving us the result b^n


;Iterative solution
;