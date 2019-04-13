(define WIDTH-OF-WORLD 500)
(define HEIGHT-OF-WORLD 200)

(define X-WORLD (/ WIDTH-OF-WORLD 2))
(define Y-WORLD (/ HEIGHT-OF-WORLD 2))

(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))


(define cat1 .)
(define cat2 .)


(define (tock ws)
  (+ ws 3))

(define (render ws)
  (place-image (get-cat-image ws) (modulo ws WIDTH-OF-WORLD) Y-WORLD BACKGROUND))

(define (get-cat-image ws)
  (cond
    [(odd? ws) cat1]
    [else cat2]))

(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))
