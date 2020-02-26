; List-of-strings -> List-of-strings
; picks out all those Strings that occur in the dictionary 
(define (in-dictionary los)
  (cond
    [(empty? los) '()]
    [(member? (first los) AS-LIST) (cons (first los) (in-dictionary (rest los)))]
    [else (in-dictionary (rest los))]))
