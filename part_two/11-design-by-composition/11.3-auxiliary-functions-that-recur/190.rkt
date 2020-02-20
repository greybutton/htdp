(check-expect (prefixes '()) '())
(check-expect (prefixes
               (list "a"))
              (list (list "a")))
(check-expect (prefixes
               (list "a" "b" "c"))
              (list
               (list "a" "b" "c")
               (list "a" "b")
               (list "a")))

(define (prefixes l)
  (cond
    [(empty? l) '()]
    [else (cons l (prefixes (reverse (rest (reverse l)))))]))


(check-expect (suffixes '()) '())
(check-expect (suffixes
               (list "a"))
              (list (list "a")))
(check-expect (suffixes
               (list "a" "b" "c"))
              (list
               (list "a" "b" "c")
               (list "b" "c")
               (list "c")))

(define (suffixes l)
  (cond
    [(empty? l) '()]
    [else (cons l (suffixes (rest l)))]))
