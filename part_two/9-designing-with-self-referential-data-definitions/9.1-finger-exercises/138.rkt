; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)

(cons 1
      (cons 2
            (cons 3
                  (cons 4
                        (cons 5 '())))))

(check-expect (sum '()) 0)
(check-expect (sum (cons 1 '())) 1)
(check-expect
 (sum (cons 1 (cons 2 '()))) 3)

(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (sum (rest l)) (first l))]))
