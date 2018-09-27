(require 2htdp/image)
(require 2htdp/universe)

; properties of the "world" and the descending rocket
(define WIDTH 400)
(define HEIGHT 400)
(define V 3)
(define X 50)

; graphical constants
(define ROCKET .)
(define MTSCN (empty-scene WIDTH HEIGHT))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

; functions
(define (picture-of-rocket.v6 t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))

(define (distance t)
  (* V t))

(animate picture-of-rocket.v6)
