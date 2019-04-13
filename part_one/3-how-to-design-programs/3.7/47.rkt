(define HAPPINESS 100)

(define WIDTH-OF-WORLD 50)
(define HEIGHT-OF-WORLD HAPPINESS)

(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

(define (tock ws)
  (- ws 0.1))

(define (render ws)
  (rectangle WIDTH-OF-WORLD ws "solid" "red"))

(define (hyper ws k)
  (cond
    [(key=? k "down") (+ ws (/ ws 5))]
    [(key=? k "up") (+ ws (/ ws 3))]
    [else ws]))

(define (stop ws)
  (<= ws 0))

(define (main ws)
  (big-bang ws
    [on-tick tock]
    [on-key hyper]
    [to-draw render]
    [stop-when stop]))

(main HAPPINESS)
