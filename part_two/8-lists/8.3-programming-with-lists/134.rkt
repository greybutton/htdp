; List-of-names -> Boolean
; determines whether String occurs on alon
(check-expect
  (contains? "Flatt" (cons "X" (cons "Y"  (cons "Z" '()))))
  #false)
(check-expect
  (contains? "Flatt" (cons "A" (cons "Flatt" (cons "C" '()))))
  #true)

(define (contains? str alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (cond
       [(string=? (first alon) str) #true]
       [else (contains? str (rest alon))])]))
