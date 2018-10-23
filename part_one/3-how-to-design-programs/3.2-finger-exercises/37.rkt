; String -> String
; remove first letter of a word
; given: hello, expect: ello
; given: world, expect: orld
(define (string-rest str)
  (substring str
             1
             (string-length str)))

(string-rest "first")
