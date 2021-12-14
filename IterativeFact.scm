
;Design Idea:


;design roles: have 3 variables
; n which stays the same: 6
; count: starts at 0 and increaments by 1 at each call call to iter
; next call: count <- count + 1
; result: starts as 1 and at each call updates to
; result <- result * (count + 1)

;the program terminates when when count = n
; giving us the result

;for (iter 0 0 1)
;at first call n=0, count=0, result=1 and this is true by design of iter

;example: (iter 6 0 1)
;(iter 6 0 1)
;(iter 6 1 1)
;(iter 6 2 2)
;(iter 6 3 6)
;(iter 6 4 24)
;(iter 6 5 120)
;(iter 6 6 720)



; when count=n we get the result


;Guess Invariant:   result = count!
; we can use GI to prove that the program works correctly.



;pre: n >=0
;post: returns the factorial of n

(define (fact n)
  (define (iter n count result)
    (cond ((= count n) result)
          (else (iter n
                      (+ count 1)
                      (* result (+ count 1))))))
  (iter n 0 1))

(fact 0)
(fact 6)
(fact 7)

;Proof(s)
; an proof by induction on the number of calls to iter to show that the Gi holds for
; every time iter is called

;basis: when count = 0, count!=result so 0!=1 . this is true by definition of iter.

;IH: asssume that iter works for count! = result.

;IS: show that call to iter works for count <- (count + 1) . when count <- (count + 1),
; (iter (+ count 1) (* (count)! (+ count 1))
; (GI: count! = result) works


;termination: count increases by 1 at each call to iter. count reachs n eventually which resturns result