; A DoorState is one of:
; – LOCKED
; – CLOSED
; – OPEN

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

; DoorState -> DoorState
; closes an open door over the period of one tick 
(define (door-closer ds)
  (cond
    [(string=? LOCKED ds) ds]
    [(string=? CLOSED ds) ds]
    [(string=? OPEN ds) CLOSED]))

(check-expect (door-closer LOCKED) LOCKED)
(check-expect (door-closer CLOSED) CLOSED)
(check-expect (door-closer OPEN) CLOSED)

; DoorState KeyEvent -> DoorState
; turns key event k into an action on state ds
(define (door-action ds k)
  (cond
    [(and (string=? LOCKED ds) (string=? "u" k)) CLOSED]
    [(and (string=? CLOSED ds) (string=? "l" k)) LOCKED]
    [(and (string=? CLOSED ds) (string=? " " k)) OPEN]
    [else ds]))

(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action OPEN "a") OPEN)
(check-expect (door-action CLOSED "a") CLOSED)

; DoorState -> Image
; renders the current state ds as an image
(define (door-render ds)
  (text ds 40 "red"))

(check-expect (door-render CLOSED) (text CLOSED 40 "red"))

; DoorState -> DoorState
; simulates a door with an automatic door closer
(define (door-simulation initial-state)
  (big-bang initial-state
    [on-tick door-closer 1]
    [on-key door-action]
    [to-draw door-render]))

; (door-simulation "locked")
