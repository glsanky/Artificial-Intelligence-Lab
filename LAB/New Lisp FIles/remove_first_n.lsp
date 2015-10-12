(set 'List '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16))

(define (remove_first_n LL n)
		(dotimes(counter n)
				(pop LL)
		)
		LL
)

(remove_first_n List 5)