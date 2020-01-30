(define-struct vec [x y])
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

(define (checked-make-vec x y)
  (cond
    [(and
      (positive? x)
      (positive? y))
     (make-vec x y)]
    [else (error "make-vec: x and y positive number expected")]))
