; An N-TrafficLight is one of:
; – 0 interpretation the traffic light shows red
; – 1 interpretation the traffic light shows green
; – 2 interpretation the traffic light shows yellow

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(define (tl-next-numeric cs) (modulo (+ cs 1) 3))

(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 2) 0)
(check-expect (tl-next-numeric 1) 2)
