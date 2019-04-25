(define WIDTH-OF-WORLD 90)
(define HEIGHT-OF-WORLD 30)
(define LIGHT-SIZE 10)
(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))
(define (CIRCLE style color)
  (circle LIGHT-SIZE style color))

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl-next cs)
    (cond
      [(string=? "red" cs) "green"]
      [(string=? "green" cs) "yellow"]
      [(string=? "yellow" cs) "red"]))

(check-expect (tl-next "red") "green")
(check-expect (tl-next "yellow") "red")
(check-expect (tl-next "green") "yellow")

; TrafficLight -> Image
; renders the current state cs as an image
(define (tl-render current-state)
  (place-image
   (CIRCLE (if (string=? current-state "red") "solid" "outline") "red")
   15 15
   (place-image
    (CIRCLE (if (string=? current-state "yellow") "solid" "outline") "yellow")
    45 15
    (place-image
     (CIRCLE (if (string=? current-state "green") "solid" "outline") "green")
     75 15
     BACKGROUND))))

(check-expect (tl-render "red") active-red)
(check-expect (tl-render "yellow") active-yellow)
(check-expect (tl-render "green") active-green)

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

; (traffic-light-simulation "red")

; design an auxiliary function for creating the image of a one-color bulb
(define active-red
  (place-image
   (circle LIGHT-SIZE "solid" "red")
   15 15
   (place-image
    (circle LIGHT-SIZE "outline" "yellow")
    45 15
    (place-image
     (circle LIGHT-SIZE "outline" "green")
     75 15
     BACKGROUND))))

(define active-yellow
  (place-image
   (circle LIGHT-SIZE "outline" "red")
   15 15
   (place-image
    (circle LIGHT-SIZE "solid" "yellow")
    45 15
    (place-image
     (circle LIGHT-SIZE "outline" "green")
     75 15
     BACKGROUND))))

(define active-green
  (place-image
   (circle LIGHT-SIZE "outline" "red")
   15 15
   (place-image
    (circle LIGHT-SIZE "outline" "yellow")
    45 15
    (place-image
     (circle LIGHT-SIZE "solid" "green")
     75 15
     BACKGROUND))))
