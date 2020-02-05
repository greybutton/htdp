(check-expect (all-true (cons true '())) #true)
(check-expect (all-true (cons false '())) #false)
(check-expect (all-true (cons #true (cons #false '()))) #false)

(define (all-true ne-l)
  (cond
    [(false? (first ne-l)) #false]
    [(empty? (rest ne-l)) #true]
    [else (all-true (rest ne-l))]))

(check-expect (one-true (cons true '())) #true)
(check-expect (one-true (cons false '())) #false)
(check-expect (one-true (cons #true (cons #false '()))) #true)
(check-expect (one-true (cons #false (cons #true '()))) #true)

(define (one-true ne-l)
  (cond
    [(equal? #true (first ne-l)) #true]
    [(empty? (rest ne-l)) #false]
    [else (one-true (rest ne-l))]))
