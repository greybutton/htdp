(require 2htdp/batch-io)

; On OS X: 
(define LOCATION "/usr/share/dict/words")
; On LINUX: /usr/share/dict/words or /var/lib/dict/words
; On WINDOWS: borrow the word file from your Linux friend
 
; A Dictionary is a List-of-strings.
(define AS-LIST (read-lines LOCATION))

; Letter, Dictionary -> Number
; counts how many words in the given Dictionary start with the given Letter
(check-expect
 (start-with# "e" (list "function" "element" "step"))
 1)
(check-expect
 (start-with# "z" (list "function" "element" "step"))
 0)
(check-expect
 (start-with# "a" (list "avocado" "Auto" "agent"))
 2)

(define (start-with# l d)
  (start-with 0 l d))

(define (start-with n l d)
  (cond
    [(empty? d) n]
    [(string=? l (string-first (first d))) (start-with (+ n 1) l (rest d))]
    [else (start-with n l (rest d))]))

(define (string-first str)
  (if (string=? str "") str (substring str 0 1)))
