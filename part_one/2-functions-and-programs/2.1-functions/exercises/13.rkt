(define (string-first str)
  (if (string=? str "") str (substring str 0 1)))

(string-first "first")
(string-first "")
