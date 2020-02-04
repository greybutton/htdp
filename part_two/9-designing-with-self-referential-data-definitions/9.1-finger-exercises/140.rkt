
(check-expect (all-true (cons true '())) #true)
(check-expect (all-true (cons false '())) #false)
(check-expect (all-true (cons #true (cons #false '()))) #false)

(define (all-true l)
  (cond
    [(empty? l) #true]
    [(false? (first l)) #false]
    [else (all-true (rest l))]))

(check-expect (one-true (cons true '())) #true)
(check-expect (one-true (cons false '())) #false)
(check-expect (one-true (cons #true (cons #false '()))) #true)

(define (one-true l)
  (cond
    [(empty? l) #false]
    [(equal? #true (first l)) #true]
    [else (one-true (rest l))]))
