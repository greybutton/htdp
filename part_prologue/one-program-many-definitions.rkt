(require 2htdp/image)
(require 2htdp/universe)

(define (picture-of-rocket.v4 height)
  (cond
    [(<= height ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 height
                  (empty-scene WIDTH HEIGHT))]
    [(> height ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP
                  (empty-scene WIDTH HEIGHT))]))

(define WIDTH 400)
(define HEIGHT 400)
(define ROCKET .)

(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

(animate picture-of-rocket.v4)

; contants
(define WIDTH.v5 400)
(define HEIGHT.v5 400)
(define ROCKET.v5 .)
(define MTSCN.v5 (empty-scene WIDTH.v5 HEIGHT.v5))
(define ROCKET-CENTER-TO-TOP.v5
  (- HEIGHT.v5 (/ (image-height ROCKET.v5) 2)))

; functions
(define (picture-of-rocket.v5 height)
  (cond
    [(<= height ROCKET-CENTER-TO-TOP.v5)
     (place-image ROCKET.v5 50 height MTSCN.v5)]
    [(> height ROCKET-CENTER-TO-TOP.v5)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP.v5 MTSCN.v5)]))

(animate picture-of-rocket.v5)
