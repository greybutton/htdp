; Number -> Number
; computes the area of a disk with radius r
(define (area-of-disk r)
  (* 3.14 (* r r)))

; Any -> Number
; computes the area of a disk with radius v, 
; if v is a number
(define (checked-area-of-disk v)
  (cond
    [(positive? v) (area-of-disk v)]
    [(negative? v) (error "area-of-disk: positive number expected")]
    [else (error "area-of-disk: number expected")]))
