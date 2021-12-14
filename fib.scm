; write a recursive fib program that takes a non negative integer input n and returns the nth fibonacci number 

; write, test, proof

;pre: fib takes input n. n is a non negative integer, n >=0

;code
; (define (fib n))

; for recursive fib, we will follow a divide and conquer approach

; first we will check for input n=0 and n=1 (basis step) and then we will check for any number n

; we can follow the definition of fib function which is...

; fib(0) = 0
; fib(1) = 1
; otherwise fib(n) = fib(n-1) + fib(n-2)

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

; it is obvious because of the definition that our guard for fib is +


; testing

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
(fib 9)
(fib 10)
(fib 30)


;post: (fib n) returns the nth fibonacci number



;Proof

; A proof by induction on n

;Basis step: (n=0 , n=1), for (fib 0) = 0 and (fib 1) = 1, we get 0 and 1 respectively. this matches the definition of fib

;IH: Assume that the recursive function call (fib n) works for any non negative integer n >= 0 or (fib n) is true
;for all n in [0,n], |0|---------------|n|

; IS: we have to show the recursive call to (fib (+ n 1)) works. from the definition of fib we know that
; (fib (+ n 1)) = (fib (- (+ n 1) 1)) + (fib (- (+ n 1) 2)) which is equal to (fib n) and (fib (- n 1). By
; IH we know that (fib n) and (fib (- n 1)) properly computes. And by definition (fib (+ n 1)) is equal
; to (+ (fib n) (fib (- n 1)) which is true or will work.


; Termination argument: for the non negative integer n or the natural number n, fib subtracts 1 or 2 at each recursive
; call and eventually it decreases to 0 or 1 which gurantees that the program will terminate.






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; b^n


;write a my-expt program that takes inputs b(a number) and n(a non negative integer) and returns b^n

;pre: inputs b is a number and n is a non negative integer


;scratchwork
; 2^2 = 4
; 1 2 3 4 5 - integers
; 1.1 1.111, 1.222 - reals, floats
; 1/2 2/3 - rationals
; 1.


;post:(my-expt b n) returns b^n 



