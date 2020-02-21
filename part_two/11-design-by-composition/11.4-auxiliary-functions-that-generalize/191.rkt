(require 2htdp/image)

(define triangle-p
  (list
    (make-posn 20 10)
    (make-posn 20 20)
    (make-posn 30 20)))

(define square-p
  (list
    (make-posn 10 10)
    (make-posn 20 10)
    (make-posn 20 20)
    (make-posn 10 20)))

; A Polygon is one of:
; – (list Posn Posn Posn)
; – (cons Posn Polygon)

; a plain background image 
(define MT (empty-scene 50 50))



; An NELoP is one of: 
; – (cons Posn '())
; – (cons Posn NELoP)

; Image NELoP -> Image 
; connects the dots in p by rendering lines in img
(define (connect-dots img p)
  MT)

(check-expect
 (connect-dots MT triangle-p)
 (scene+line
  (scene+line
   (scene+line MT 20 0 10 10 "red")
   10 10 30 10 "red")
  30 10 20 0 "red"))

(check-expect
  (connect-dots MT square-p)
  (scene+line
    (scene+line
      (scene+line
        (scene+line MT 20 0 20 20 "red")
        20 20 40 20 "red")
      40 20 40 0 "red")
    40 0 20 0 "red"))
