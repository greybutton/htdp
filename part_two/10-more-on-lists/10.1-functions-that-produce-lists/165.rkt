; String String List-of-strings -> List-of-strings
; produces new list of strings by replacing all 'old' with 'new'

(check-expect
 (substitute "robot" "r2d2" (cons "test" (cons "robot" '())))
 (cons "test" (cons "r2d2" '())))

(define (substitute old new los)
  (cond
    [(empty? los) '()]
    [else (cons (change old new (first los)) (substitute old new (rest los)))]))

(define (change old new word)
  (if (string=? word old)
      new
      word))
