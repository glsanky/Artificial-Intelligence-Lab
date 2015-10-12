(set 'List '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16))

(define (remove_nth LL n)
		LL
		(setq a 1)
		(dotimes(counter n)
				(setq a (+ a 1))
		)
		(pop LL a)
		LL
)

(remove_nth List 5)