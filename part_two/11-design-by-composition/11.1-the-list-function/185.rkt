; 1.
(check-expect
 (first (list 1 2 3))
 1)

; 2.
(check-expect
 (rest (list 1 2 3))
 (list 2 3))

; 3.
(check-expect
 (second (list 1 2 3))
 2)
