; 1.
(check-expect
 (cons "a" (list 0 #false))
 (list "a" 0 #false))

; 2.
(check-expect
 (list (cons 1 (cons 13 '())))
 (list (list 1 13)))

; 3.
(check-expect
 (cons (list 1 (list 13 '())) '())
 (list (list 1 (list 13 '()))))

; 4.
(check-expect
 (list '() '() (cons 1 '()))
 (list '() '() (list 1)))

; 5.
(check-expect
 (cons "a" (cons (list 1) (list #false '())))
 (list "a" (list 1) #false '()))
