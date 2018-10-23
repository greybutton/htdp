; String -> String
; extract first letter of word
; given: hello, expect: h
; given: world, expect: w
(define (string-first str)
  (substring str 0 1))

(string-first "first")
