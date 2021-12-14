;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; DEFINITION  Say that a nonnegative integer m is <=-sorted if its digits,
; read left to right, form a non-decreasing sequence.
; Thus 333588 is <=-sorted.

; Problem 1a (17 points).  Specify, design, develop, code and prove correct an R5RS Scheme program,
; named combine, which inputs integers m >= 0 and n >= 0, and which outputs the <=-sorted number formed
; from all of the digits of m and n, omitting
; 0s (if any).  Multiplicities must be preserved
;-- for example, (combine 163133 9423451) = 1112333344569.  

; Your code must work with just a single scan of each input.
; Note that m and n will usually have different numbers of digits,
; and that you may not assume either of them is <=-sorted. 

; You will want to begin by thinking of a functional decomposition of the problem: helper functions are
; expected. As we have stated in class, helper functions also require a full development, in the style
; we have been using in CSc 335.


;;;;;     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

; Again: I am looking for a solution which carries out just ONE scan of m and ONE scan of n.

;;;;;     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


; The function combine itself may be either recursive or iterative, but your submitted paper must contain full
; development, code and proof for at least one recursive function and at least one iterative function.

; To merit partial credit, submitted code must be working (even if just helper functions), with tests shown.  

;recursive program


;design idea: we can find a way to combine the digits of m and n (maybe design a helper function for it)
; and then we take that number  with combined digits and sort it

;helper function idea: combine-digits that takes m >= 0 and n >=0 and returns an integer >=0
; that has all digits of m and n

    ;one idea: say m has k digits.

    ;;divide and conquer approach: we take the simplest subdivision of the the
    ; combine-digits problem that to say when n = 0, return m+0 which m



    ;otherwise, keep m as it is and take the rightmost digit of n,
    ; multiply the rightmost digit by 10^(highest-power-of-m + 1) and
    ; use + as guard and add the value to m


; idea: design a helper function highest-power-of-ten that computes
; log of n in base 10 and return the highest power of ten in n

(define (highest-power-of-ten n)
  (inexact->exact (floor (log n 10))))

;testing
(highest-power-of-ten 1234)


; 123 12

;(+ m (* (remainder n 10) (expt 10 (+ 1 (highest-power-of-ten m)))))
            

;pre: inputs integers m >= 0 and n >= 0
;post: outputs the <=-sorted number formed; from all of the digits of m and n


(define (combine-digits m n)
  (cond ((zero? n) m)
        (combine-digits (+ m (* (remainder n 10)
                    (expt 10 (+ 1 (highest-power-of-ten m))))) (quotient n 10))))
  


(combine-digits 3 123)
