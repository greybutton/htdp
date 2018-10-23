; String -> String
; remove last letter of a word
; given: hello, expect: hell
; given: world, expect: worl
(define (string-remove-last str)
  (substring str
             0
             (- (string-length str) 1)))

(string-remove-last "first")
