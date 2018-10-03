(require 2htdp/image)

; 1
(define x 12)
(define y 5)

(sqrt (+ (sqr x) (sqr y)))

; 2
(define prefix "hello")
(define suffix "world")

(string-append prefix "_" suffix)

; 3
(define str "helloworld")
(define i 5)

(string-append
 (substring str 0 i)
 "_"
 (substring
  str
  i
  (string-length str)))

; 4
(string-append
 (substring str 0 i)
 (substring
  str
  (+ i 1)
  (string-length str)))

; 6
(define cat .)
(* (image-width cat) (image-height cat))

; 7
(define sunny #true)
(define friday #false)

(and (not sunny) friday)

; 8
(define (image-type image)
  (cond
    [(= (image-width image) (image-height image)) "square"]
    [(> (image-width image) (image-height image)) "wide"]
    [(< (image-width image) (image-height image)) "tall"]))

(image-type cat)
