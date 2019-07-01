(define (manhattan-distance ap)
  (+
   (posn-x ap)
   (posn-y ap)))

(check-expect (manhattan-distance (make-posn 0 5)) 5)
(check-expect (manhattan-distance (make-posn 7 0)) 7)
(check-expect (manhattan-distance (make-posn 3 4)) 7)
