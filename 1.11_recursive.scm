; a function f is defined by the rule that f(n) = n if n < 3
; f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3) if n>=3
; write a procedure that computes f by means of recursive process
;write a procedure that computes f by means of an ietrative process

;Design Idea: use the definition to design the recursive function (f n)
; program terminates when n < 3 returning the result of f(n)


;pre: takes an integer input n
;post: returns f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3)

;code:

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))




;testing
(f 3)
(f 2)
(f -12)
(f 10)


;basis: (n < 3), since n is less than 3, (f n) just return n

;IH: Assume that the recursive call to (f (- n 1)) works that is to say
; that f(n-1) is computed correctly

;IS: show that (f n) works which means (f n) computes the correct output.
; at (f n) we get (+ (f (- n 1)) (* 2 (f (- n 2)))(* 3 (f (- n 3)))). By IH we know that
; the recursion call to (f (- n 1)) works . for the next call we get the correct result.
;

;Termination arguement: n is non negative integer greater than equal to 3 which means
; n decrements at each call and eventually decreases to become n<3 which will terminate
; the program returning an output 