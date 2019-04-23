; An LR (short for launching rocket) is one of:
; – "resting"
; – NonnegativeNumber
; interpretation "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight

(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 100)
(define MTSCN (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(place-image ROCKET (/ WIDTH 2) 0 MTSCN)
(place-image ROCKET (/ WIDTH 2) HEIGHT MTSCN)
(place-image ROCKET (/ WIDTH 2) 50 MTSCN)
