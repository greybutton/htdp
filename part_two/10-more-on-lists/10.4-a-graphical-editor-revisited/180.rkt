; Lo1s -> Image
; renders a list of 1Strings as a text image 
(define (editor-text s)
  (text (text-append s) FONT-SIZE FONT-COLOR))

(define (text-append s)
  (cond
    [(empty? s) ""]
    [else (string-append
           (first s)
           (text-append (rest s)))]))

(check-expect
  (editor-text
   (cons "p" (cons "o" (cons "s" (cons "t" '())))))
  (text "post" FONT-SIZE FONT-COLOR))
