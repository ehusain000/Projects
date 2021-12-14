; 3.  Write iterative and recursive scheme programs to test whether the digits in a non-negative
; integer are in increasing order.  For example, the digits of 12348 are in increasing order, while
; those of 12343 are not.

;Design Idea:

;we take a divide and conquer approach. we ask what is simplest case for this problem
; which part of the problem can not be subdivided any longer
; which would when k=1 (digit in k) or n is single digit integer. when k=1 we know that
; n indeed is in increasing order or (increasing? n) would evaluate to true.

; as for n with k digit we can take the rightmost digit of n (remainder n 10) and
; compare it to the rightmost digit of (quotient n 10)

;if evaluates to #t then truncate n by 1 digit

;otherwise return #f


;pre: input n is a non-negative integer
;post: test whether the digits in a non-negative integer are in increasing order
; return # if increasing order, #f otherwise

;code:
(define (increasing? n)
  (cond ((< n 10) #t)
        ((> (remainder n 10) (remainder (quotient n 10) 10))
         (increasing? (quotient n 10)))
        (else #f)))



;testing:
(increasing? 12348)
(increasing? 12343)
(increasing? 9)
(increasing? 91)

; Proof(s)
; a proof by induction on k (the digit of n)

; basis: (k=1) when k=1 or n < 10, we know that n is a single digit and the digit is
; considered to be in an increasing order. so (increasing? n) would return #f.

; IH: assume the recursion call works for (increasing? (quotient n 10)).
; that is to say that the recursive call for (k-1) digit does indeed return a result
; the recursive call compares each digit of n and returns a value #t or #f

; IS: show that the recursive call work for k digit. by IH, we know that recursive call
; works for k digits. so using IH, for (increasing? n), ((> (remainder n 10) (remainder (quotient n 10) 10))
;         (increasing? (quotient n 10)))
; would evaluate to a value #t or #f as the rightmost digit of n is being compared to
; to the rightmost digit of (quotient n 10).

;Termination argument: n is non negative integer and at each call n truncates by 1 digit and eventually
; truncates to a single digit which halts the program and returns an output #t or #f