;Exercise 1.30
;The sum procedure above generates a linear
;recursion. The procedure can be rewritten so that the sum
;is performed iteratively. Show how to do this by filling in
;the missing expressions in the following definition

;Iterative sum

;Design Idea:
;Variable Design Roles:

;wrapper function: sum
;term: any function that makes sense for sum of a to b (eg. sqaure, cube, sqrt)
;a: a non negative integer - initial a (A)
;b: a non negative integer, b stays same as we increment a by next
;next: any function reduces the gap between a to b and makes sense for sum of a to b (eg. inc add-4)

;work horse function: iter
;a: at each call to iter, value of a updates to (next a) (eg. (inc a): (+ a 1), (add-4 a): (+ a 4))
;at each call to iter, the gap between a to b reduces(gap size depends on the next function)

;result: at each call to iter, result updates to result = result-so-far + (term a)


;How will I work toward termination while keeping the invariant true
;Guess Invariant1(Invariant ^ stopping condition => post condition):
;result = result-so-far + (term a)

;Test the Guess Invariant:
;Strong enough? at the last call to iter a is (next a) which means that a > b and result is result-so-far + (term a)
; which computes correctly.
;Weak enough? at the first call to iter, a is initial input A and the gap is 0, so result is 0


;Preservability? at any call to iter a is (next a) and result is (+ result-so-far (term a)) which is the computed
;correctly
;(sum (lambda (x) x) 1 inc 5)
;(iter a result)
;(iter 1 0)
;(iter 2 (+ 0 1))
;(iter 3 (+ 1 2))
;(iter 4 (+ 3 3))
;(iter 5 (+ 6 4))
;(iter 6 (+ 10 5))
;(iter 7 (+ 15 6))


;Termination: at each call to iter, the gap between a to b decreases and eventually value of a becomes greater
; than b which return the result and program terminates.

;Pre Condition: a and b are non negative integers and term and next makes sense for a and b
;Post Condition: returns the sum from a to b

;Code

;Auxilary Functions

(define square
  (lambda (x) (* x x)))

(define cube
  (lambda (x) (* x (square x))))

(define inc
  (lambda (x) (+ x 1)))

(define add-4
  (lambda (x) (+ x 4)))


;Main function

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))


;Testing
(sum (lambda (x) x) 1 inc 5)
(sum square 1 inc 10)
(sum cube 1 inc 10)

(sum (lambda (x) x) 1 add-4 100)
(sum square 1 add-4 100)
(sum cube 1 add-4 100)

;bad test
;(sum (lambda (x) x) 1 square 100)
;(sum square 1 square 100)
;(sum cube 1 square 100)