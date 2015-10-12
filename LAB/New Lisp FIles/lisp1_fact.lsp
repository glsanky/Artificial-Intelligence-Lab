(define (fact n)
    (if (= n 1) 1
    		(*  (fact (- n 1)) 
						 n)))

(define (fact_iter n , f)
    (set 'f '(1))
    (dotimes (i n)
         (push (* (pop f) (+ i 1)) f)) )
