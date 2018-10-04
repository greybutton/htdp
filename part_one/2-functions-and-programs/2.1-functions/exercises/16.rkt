(require 2htdp/image)

(define (image-area image)
  (* (image-width image) (image-height image)))

(image-area .)
