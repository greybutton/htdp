(define (string-last str)
  (if (string=? str "")
      str
      (substring
       str
       (- (string-length str) 1)
       (string-length str))))

(string-last "first")
(string-last "")
