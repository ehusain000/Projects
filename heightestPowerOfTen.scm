(define (highestPowerOfTen n)
  (inexact->exact(floor (log n 10))))


(highestPowerOfTen 1234)

(remainder 1234 10)


(* 4
(expt 10 (highestPowerOfTen 1234)))