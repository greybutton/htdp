(define RED "red")
(define GREEN "green")
(define YELLOW "yellow")

; An S-TrafficLight is one of:
; – RED
; – GREEN
; – YELLOW

; S-TrafficLight -> S-TrafficLight
; yields the next state, given current state cs	
(define (tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))

(check-expect (tl-next-symbolic RED) GREEN)
(check-expect (tl-next-symbolic YELLOW) RED)
(check-expect (tl-next-symbolic GREEN) YELLOW)
