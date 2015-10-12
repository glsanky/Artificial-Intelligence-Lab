(set 'List '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16))

(define (remove_last_n LL n)
		LL
		(dotimes(counter n)
				(pop LL -1)
		)
		LL
)

(remove_last_n List 5)