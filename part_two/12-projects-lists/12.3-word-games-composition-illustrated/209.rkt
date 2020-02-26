; String -> Word
; converts s to the chosen word representation 
(define (string->word s)
  (explode s))
 
; Word -> String
; converts w to a string
(define (word->string w)
  (implode w))
