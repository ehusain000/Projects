(define atom?
  (lambda (x)
    (and (not (null? x)) 
	 (not (pair? x)))))

(atom? '(a b c))
