(check-expect (posn-up-x (make-posn 10 10) 5) (make-posn 5 10))

(define (posn-up-x p n)
  (make-posn n (posn-y p)))
