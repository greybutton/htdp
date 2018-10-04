(require 2htdp/image)

(define (image-classify image)
  (cond
    [(= (image-width image) (image-height image)) "square"]
    [(> (image-width image) (image-height image)) "wide"]
    [(< (image-width image) (image-height image)) "tall"]))

(image-classify .)
