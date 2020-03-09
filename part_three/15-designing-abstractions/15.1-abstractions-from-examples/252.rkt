(define (fold2 f i l)
  (cond
    [(empty? l) i]
    [else
     (f (first l)
        (fold1 f i (rest l)))]))
