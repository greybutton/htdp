(define (string-insert str i)
  (cond
    [(< (string-length str) i) str]
    [(string=? str "") str]
    [else (string-append
           (substring str 0 i)
           "_"
           (substring
            str
            i
            (string-length str)))]))


(string-insert "helloworld" 5)
(string-insert "" 5)
(string-insert "hi" 5)
