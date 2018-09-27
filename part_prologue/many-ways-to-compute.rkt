(require 2htdp/image)
(require 2htdp/universe)

(define (sign x)
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))

(sign -5)

(define (picture-of-rocket.v2 height)
  (cond
    [(<= height 60)
     (place-image . 50 height
                  (empty-scene 100 60))]
    [(> height 60)
     (place-image . 50 60
                  (empty-scene 100 60))]))

(animate picture-of-rocket.v2)

(define (picture-of-rocket.v3 height)
  (cond
    [(<= height (- 60 (/ (image-height .) 2)))
     (place-image . 50 height
                  (empty-scene 100 60))]
    [(> height (- 60 (/ (image-height .) 2)))
     (place-image . 50 (- 60 (/ (image-height .) 2))
                  (empty-scene 100 60))]))

(animate picture-of-rocket.v3)
