(define (string-delete str i)
  (cond
    [(< (string-length str) i) str]
    [(string=? str "") str]
    [else (string-append
           (substring str 0 i)
           (substring
            str
            (+ i 1)
            (string-length str)))]))


(string-delete "helloworld" 5)
(string-delete "" 5)
(string-delete "hi" 5)
