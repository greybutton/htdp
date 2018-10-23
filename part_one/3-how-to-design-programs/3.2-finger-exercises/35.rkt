; String -> String
; extract last letter of word
; given: hello, expect: o
; given: world, expect: d
(define (string-last str)
  (substring str
             (- (string-length str) 1)
             (string-length str)))

(string-last "first")
