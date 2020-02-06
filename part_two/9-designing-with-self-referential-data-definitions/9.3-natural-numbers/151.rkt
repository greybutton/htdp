(check-expect (multiply 3 3) 9)
(check-expect (multiply 3 1) 3)
(check-expect (multiply 3 0) 0)

(define (multiply a b)
  (cond
    [(zero? b) 0]
    [else (+ a (multiply a (sub1 b)))]))
