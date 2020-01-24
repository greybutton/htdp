(require 2htdp/image)
(require 2htdp/universe)

(define HAPPINESS 100)

(define WIDTH-OF-WORLD 500)
(define HEIGHT-OF-WORLD HAPPINESS)

(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

(define-struct cat [x hap])
; A Cat is a structure:
;   (make-cat Number Number)
; interpretation (make-cat x h) describes a cat
; that is at x-position 'x' and has happiness level 'n'

(define (tock cat)
  (make-cat
   (+ (cat-x cat) 1)
   (- (cat-hap cat) 0.1)))

(define (happiness-bar cat)
  (rectangle 10 (cat-hap cat) "solid" "red"))

(define (happy-cat cat)
  (place-image
   (rectangle 10 10 "solid" "black")
   (cat-x cat)
   HEIGHT-OF-WORLD
   (rectangle 10 10 "solid" "black")))

(define (render cat)
  (place-image/align
   (rectangle 10 10 "solid" "black")
   (cat-x cat) HEIGHT-OF-WORLD "center" "center"
   (overlay/align "left" "bottom"
                  (happiness-bar cat)
                  BACKGROUND)))
                   


(define (hyper cat k)
  (cond
    [(key=? k "down") (make-cat
                       (cat-x cat)
                       (+ (cat-hap cat) (/ (cat-hap cat) 5)))]
    [(key=? k "up") (make-cat
                     (cat-x cat)
                     (+ (cat-hap cat) (/ (cat-hap cat) 3)))]
    [else cat]))

(define (stop cat)
  (or
   (= (cat-x cat) WIDTH-OF-WORLD)
   (<= (cat-hap cat) 0)))

(define (main cat)
  (big-bang cat
    [on-tick tock]
    [on-key hyper]
    [to-draw render]
    [stop-when stop]))

(main (make-cat 1 10))
