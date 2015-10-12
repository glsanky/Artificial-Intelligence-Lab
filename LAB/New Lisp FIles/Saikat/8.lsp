;push elements into database Students
;(push '("Saikat" 20 CSE) Students -1)
;(push '("Deepak" 22 CSE) Students -1)
;(push '("Soumyadip" 21 CSE) Students -1)
;(push '("Siddarth" 21 CSE) Students -1)


;(lookup "Siddarth" Students -1)

;delete data
;(replace (assoc "Siddarth" Students) Students)

;push another data

;(push '("Sidharth" 21 CHE) Students -1)

;modify database : Change Siddharth's branch to CHE

(setf (assoc "ABC" Students) '("ABC" 25 CSE))

(println Students)

;(assoc "Saikat" Students)

;(nth 1 Students)