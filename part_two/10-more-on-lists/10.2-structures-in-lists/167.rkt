(check-expect (sum (cons (make-posn 1 2) '())) 1)
(check-expect
 (sum
  (cons (make-posn 2 1)
        (cons (make-posn 1 2)
              '()))) 3)

(define (sum lop)
  (cond
    [(empty? (rest lop)) (posn-x (first lop))]
    [else (+ (posn-x (first lop)) (sum (rest lop)))]))
