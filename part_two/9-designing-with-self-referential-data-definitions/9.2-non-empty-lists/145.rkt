(check-expect
 (sorted>? (cons 3 (cons 2 (cons 1 '())))) #true)
(check-expect
 (sorted>? (cons 3 (cons 5 (cons 1 '())))) #false)

(define (sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [(> (first ne-l) (first (rest ne-l))) (sorted>? (rest ne-l))]
    [else #false]))
