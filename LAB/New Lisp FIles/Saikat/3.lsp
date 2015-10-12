(set 'phrase '("the" "quick" "brown" "fox" "jumped" "over" "the" "lazy" "dog"))

(set 'a (length phrase))

(set 'inp (int (read-line)))

(set 'n (- a inp))

(slice phrase n a)
