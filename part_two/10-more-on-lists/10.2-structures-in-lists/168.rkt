(check-expect
 (translate (cons (make-posn 1 2) '()))
 (cons (make-posn 1 3) '()))
(check-expect
 (translate
  (cons (make-posn 2 1)
        (cons (make-posn 1 2)
              '())))
 (cons (make-posn 2 2)
       (cons (make-posn 1 3)
             '())))

(define (translate lop)
  (cond
    [(empty? (rest lop)) (cons (t (first lop)) '())]
    [else (cons (t (first lop)) (translate (rest lop)))]))

(define (t p)
  (make-posn
   (posn-x p)
   (+ 1 (posn-y p))))
