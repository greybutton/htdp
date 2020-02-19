; 1.
(check-expect
 (list (string=? "a" "b") #false)
 (list #false #false))

; 2.
(check-expect
 (list (+ 10 20) (* 10 20) (/ 10 20))
 (list 30 200 0.5))

; 3.
(check-expect
 (list "dana" "jane" "mary" "laura")
 (list "dana" "jane" "mary" "laura"))
