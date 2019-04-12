(define WIDTH-OF-WORLD 500)
(define HEIGHT-OF-WORLD 200)

(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

(define Y-CAR (/ HEIGHT-OF-WORLD 2))

(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define CAR-UPPER-WIDTH (* WHEEL-RADIUS 6))
(define CAR-UPPER-HEIGHT (* WHEEL-RADIUS 2))
(define CAR-LOWER-WIDTH (* WHEEL-RADIUS 10))
(define CAR-LOWER-HEIGHT (* WHEEL-RADIUS 2))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "transparent"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-BODY
  (above
   (rectangle CAR-UPPER-WIDTH CAR-UPPER-HEIGHT "solid" "red")
   (rectangle CAR-LOWER-WIDTH CAR-LOWER-HEIGHT "solid" "red")))

(define CAR
  (above CAR-BODY BOTH-WHEELS))

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock ws)
  (+ ws 3))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? me "button-down") x-mouse]
    [else x-position-of-car]))

; WorldState -> Boolean
(define (end-world ws)
  (>= ws WIDTH-OF-WORLD))

(define (main ws)
   (big-bang ws
     [on-tick tock]
     [on-mouse hyper]
     [to-draw render]
     [stop-when end-world]))
