(define-struct r3 [x y z])
; An R3 is a structure:
;   (make-r3 Number Number Number)
 
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))

; R3 -> Number 
; determines the distance of p to the origin 
(define (r3-distance-to-0 p)
  (sqrt (+ (sqr (r3-x p)) (sqr (r3-y p)) (sqr (r3-z p)))))

(check-expect (r3-distance-to-0 (make-r3 0 0 0)) 0)
(check-within (r3-distance-to-0 (make-r3 1 1 1)) (sqrt 3) 0)
(check-within (r3-distance-to-0 (make-r3 2 2 2)) (sqrt 12) 0)
(check-within (r3-distance-to-0 (make-r3 1 2 13)) (sqrt 174) 0)
(check-within (r3-distance-to-0 (make-r3 -1 0 3)) (sqrt 10) 0)
