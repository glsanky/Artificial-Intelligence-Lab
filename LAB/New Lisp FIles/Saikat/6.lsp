(set 'phrase '("the" "quick" "brown" "fox" "jumped" "over" "the" "lazy" "dog"))

(set 'a (length phrase))

(set 'inp (int (read-line)))

(set 'last_n (- a inp))

(slice phrase 0  last_n)