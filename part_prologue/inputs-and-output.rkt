(require 2htdp/image)
(require 2htdp/universe)

(define (y x) (* x x))

(empty-scene 100 60)

(place-image . 50 23 (empty-scene 100 60))

(define (picture-of-rocket height)
  (place-image . 50 height (empty-scene 100 60)))

(animate picture-of-rocket)
