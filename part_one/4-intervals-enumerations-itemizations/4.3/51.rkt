(define WIDTH-OF-WORLD 100)
(define HEIGHT-OF-WORLD 100)
(define X-WORLD (/ WIDTH-OF-WORLD 2))
(define Y-WORLD (/ HEIGHT-OF-WORLD 2))
(define LIGHT-SIZE (/ WIDTH-OF-WORLD 2))
(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

(define (get-light color)
  (circle LIGHT-SIZE "solid" color))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "yellow") "red")
(check-expect (traffic-light-next "green") "yellow")

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

(define (render color)
  (place-image (get-light color) X-WORLD Y-WORLD BACKGROUND))

(define (main color rate limit)
  (big-bang color
    [on-tick traffic-light-next rate limit]
    [to-draw render]))

(main "red" 1 10)
