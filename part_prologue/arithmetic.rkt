(require 2htdp/image)

"hello world"

(string-append "hello" "world")
(string-append "hello " "world")
(string-append "hello" " " "world")
(string-length "hello")
(substring "hello" 1 3)
(string-upcase "hello")
(string-downcase "WORLD")
(string? "hello")
(string=? "hello" "world")
(string=? "abc" "abc")

(string->number "42")
(number->string 42)

(> 10 9)
(< -1 0)
(= 42 1)
(>= 10 10)
(<= -1 0)

(* (image-width .) (image-height .))

(circle 10 "outline" "blue")
(rectangle 30 20 "solid" "red")

(overlay 
  (circle 5 "solid" "blue")
  (rectangle 20 20 "solid" "red"))

(overlay 
  (rectangle 20 20 "outline" "red")
  (circle 5 "solid" "blue"))

(place-image 
  (circle 5 "solid" "violet")
  50 80
  (empty-scene 100 100))
