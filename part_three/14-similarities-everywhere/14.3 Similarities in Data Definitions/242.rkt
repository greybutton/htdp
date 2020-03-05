; String [List-of String] -> [Maybe [List-of String]]
; returns the remainder of los starting with s 
; #false otherwise 
(check-expect (occurs "a" (list "b" "a" "d" "e"))
              (list "d" "e"))
(check-expect (occurs "a" (list "b" "c" "d")) #f)

(define (occurs s los)
  (cond
    [(empty? los) #f]
    [(string=? s (first los)) (rest los)]
    [else (occurs s (rest los))]))
