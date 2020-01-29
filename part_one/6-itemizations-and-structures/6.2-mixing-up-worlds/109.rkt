(require 2htdp/image)
(require 2htdp/universe)

(define SCENE-WIDTH 100)
(define SCENE-HEIGHT 100)
(define BACK (empty-scene SCENE-WIDTH SCENE-HEIGHT))

; A State is one of:
; - START
; – YELLOW
; - GREEN
; – RED
(define START "white")
(define EXPECT "yellow")
(define FINISHED "green")
(define ERROR "red")

(define (start? s)
  (string=? s START))
(define (expect? s)
  (string=? s EXPECT))
(define (finished? s)
  (string=? s FINISHED))
(define (error? s)
  (string=? s ERROR))

(define (action s ke)
  (cond
    [(start? s)
     (cond
       [(string=? ke "a") EXPECT]
       [else ERROR])]
    [(expect? s)
     (cond
       [(string=? ke "b") EXPECT]
       [(string=? ke "c") EXPECT]
       [(string=? ke "d") FINISHED]
       [else ERROR])]))

(check-expect (action START "a") EXPECT)
(check-expect (action START " ") ERROR)
(check-expect (action EXPECT "b") EXPECT)
(check-expect (action EXPECT "e") ERROR)
(check-expect (action EXPECT "d") FINISHED)

(define (render s)
  (place-image/align
   (rectangle 50 50 "solid" s)
   50 50 "center" "center"
   BACK))
  
; State -> State
(define main
  (big-bang START
    [on-key action]
    [to-draw render]))
