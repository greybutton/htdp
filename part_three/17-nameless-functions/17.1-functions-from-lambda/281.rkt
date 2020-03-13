(lambda (x) (< x 10))

(lambda (x y) (number->string (* x y)))

(lambda (x)
  (cond
    [(even? x) 0]
    [else 1]))
