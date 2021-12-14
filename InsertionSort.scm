; idea: design a helper function highest-power-of-ten that computes
; log of n in base 10 and return the highest power of ten in n

(define (highest-power-of-ten n)
  (inexact->exact (floor (log n 10))))

;testing
(highest-power-of-ten 9)


;insertion sort

;sorted-digit assume already sorted
;unsorted-digit: if (> unsorted-digit sorted-digit)
; then place unsorted-digit right of sorted-digit
;otherwise place unsorted-digit left of the sorted digit

;assume last-element of the array to be sorted
;first-element : (remainder n 10)

;key : (remainder (quotient n 10) 10)

;if (< first-element key)
; then place key before first element
;otherwise place it after first element

(define first-element 1)
(define key 2)

(if (< first-element key)
    (+ first-element (* key (expt 10 (highest-power-of-ten first-element))))
    (+ key (* first-element (expt 10 (highest-power-of-ten key)))))
