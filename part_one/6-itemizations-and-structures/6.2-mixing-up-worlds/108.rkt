(require 2htdp/image)
(require 2htdp/universe)

(define SCENE-WIDTH 100)
(define SCENE-HEIGHT 100)
(define BACK (empty-scene SCENE-WIDTH SCENE-HEIGHT))

; A TrafficLight is one of:
; – GREEN
; – RED
(define GREEN "green")
(define RED "red")

(define-struct tl [state count])
; An Traffic Light is a structure:
;   (make-tl String Number)
; interpretation (make-tl s n) describes an traffic light
; whose visible text is count with color state

; TrafficLight -> TrafficLight
; yields the next state, given current state tl
(define (traffic-light-tick tl)
  (cond
    [(and
      (= (tl-count tl) 0)
      (string=? (tl-state tl) GREEN))
     (make-tl RED 10)]
    [(and
      (= (tl-count tl) 0)
      (string=? (tl-state tl) RED))
     (make-tl GREEN 10)]
    [else (make-tl
           (tl-state tl)
           (- (tl-count tl) 1))]))

(check-expect (traffic-light-tick (make-tl RED 10)) (make-tl RED 9))
(check-expect (traffic-light-tick (make-tl GREEN 10)) (make-tl GREEN 9))

; TrafficLight KeyEvent -> TrafficLight
; turns key event ke into an action on state tl
(define (traffic-light-action tl ke)
  (cond
    [(and
      (string=? ke " ")
      (string=? (tl-state tl) RED)) (make-tl GREEN 10)]
    [else tl]))

(check-expect (traffic-light-action (make-tl RED 10) "a") (make-tl RED 10))
(check-expect (traffic-light-action (make-tl RED 10) " ") (make-tl GREEN 10))
(check-expect (traffic-light-action (make-tl GREEN 10) "a") (make-tl GREEN 10))
(check-expect (traffic-light-action (make-tl GREEN 10) " ") (make-tl GREEN 10))

; TrafficLight -> Image
; renders the current state tl as an image
(define (traffic-light-render tl)
  (place-image/align
   (text (number->string (tl-count tl)) 50 (tl-state tl))
   50 50 "center" "center"
   BACK)) 

(check-expect
  (traffic-light-render (make-tl RED 10))
  (place-image/align
   (text (number->string 10) 50 "red")
   50 50 "center" "center"
   BACK))

; TrafficLight -> TrafficLight
; simulates a traffic light
(define main
  (big-bang (make-tl RED 10)
    [on-tick traffic-light-tick 1]
    [on-key traffic-light-action]
    [to-draw traffic-light-render]))
