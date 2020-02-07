(define-struct layer [color doll])

; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)

(check-expect (depth "red") 1)
(check-expect
  (depth
   (make-layer "yellow" (make-layer "green" "red")))
  3)

; RD -> Number
; how many dolls are a part of an-rd 
(define (depth an-rd)
  (cond
    [(string? an-rd) 1]
    [else (+ (depth (layer-doll an-rd)) 1)]))

(check-expect (colors "red") "red")
(check-expect
  (colors
   (make-layer "yellow" (make-layer "green" "red")))
  "yellow, green, red")

; RD -> Number
; color dolls are a part of an-rd 
(define (colors an-rd)
  (cond
    [(string? an-rd) an-rd]
    [else (string-append
           (layer-color an-rd)
           ", "
           (colors (layer-doll an-rd)))]))
