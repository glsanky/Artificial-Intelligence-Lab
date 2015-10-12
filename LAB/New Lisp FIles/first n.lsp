(set 'L '(1 2 3 4 5 6 7 8 9))

(define (print_n LL n)
		(dotimes (counter n)
				(print (LL counter))
		)
)

(print_n L 6)