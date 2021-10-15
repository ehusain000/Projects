; 2.  Write iterative and recursive scheme functions to return the sum of the digits within
; a non-negative integer.  For example, (sum-of-digits 345) is 12.


;program - The function sum-of-digits takes input n

;1. pre cond: input n is a non negative integer


;2. solution:

;scratch work
;1 2 3 4 5 1234 are considered to be integers

;(define (sum-of-digits n))

; (sum-of-digits 345)

;one idea: take the rightmost digit
; use (remainder 345 10) to get the rightmost digit
; (remainder n 10) gives us the rightmost digit

; at each recursive call, we can truncate n by 10
;(quotient n 10)

; for any integer n greater 10 (n > 10):


; at each recursive call, we take the right most digit and use + as guard
; at first n = 345: first recursive call: (+ 5 (sum-of-digits 34))
; 2nd recusive call (+4 (sum-of-digits 3))
; 3rd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Idea: We will take a divide and conquer approach. we will consider the simplest case:
; a non negative integer n with a single digit that n < 10 [0,9]. The sum of digit of an integer with a
; single digit is the number itself (n in this case)

;For any non negative integer n greater than 10, we extract take the rightmost digit of n using the built in
; remainder function (remainder n 10) and then we truncate n with the built in quotient function (quotient n 10)
; which returns the quotient of n.

; at each recursive call, we use + operator as guard and add the digits of n.
; n will eventually truncate and become less than 10.
; when n < 10, the recursive call returns n


(define (sum-of-digits n)
  (cond ((< n 10) n)
        (else (+ (remainder n 10) (sum-of-digits (quotient n 10))))))

;testing

(sum-of-digits 0)
(sum-of-digits 9)
(sum-of-digits 10)
(sum-of-digits 123)
(sum-of-digits 345)
(sum-of-digits 123456789123456789)
(sum-of-digits 123456789123456789123456789123456789)

;3. post cond: sum-of-digits return the sum of the digits of n




;Proof(s)

;A proof by induction

;Basis: n < 10. when n    
;Induction Hypothesis:
;Induction Step:


;QED