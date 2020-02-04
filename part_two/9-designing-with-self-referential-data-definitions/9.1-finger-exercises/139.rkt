; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)

(check-expect (pos? (cons 5 '())) #true)
(check-expect (pos? (cons -1 '())) #false)

(define (pos? l)
  (cond
    [(empty? l) #true]
    [(negative? (first l)) #false]
    [else (pos? (rest l))]))


(check-expect (checked-sum (cons 5 '())) 5)
(check-expect (checked-sum (cons 1 (cons 2 '()))) 3)
(check-error (checked-sum (cons -1 '())) "sum: positive expected")

(define (checked-sum l)
  (cond
    [(pos? l) (sum l)]
    [else (error "sum: positive expected")]))

(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (sum (rest l)) (first l))]))
