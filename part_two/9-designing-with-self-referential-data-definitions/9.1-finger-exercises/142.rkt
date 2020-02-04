(require 2htdp/image)

(define SQ25 (rectangle 25 25 "solid" "blue"))
(define SQ9 (rectangle 9 9 "solid" "blue"))
(define R5 (rectangle 5 25 "solid" "blue"))

(check-expect (ill-sized?
               (cons SQ25 (cons SQ9 (cons R5 '())))
               25)
              SQ9)
(check-expect (ill-sized?
               (cons R5 (cons SQ9 '())) 9) R5)
(check-expect (ill-sized?
               (cons SQ9 '()) 9) #f)

(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [(and
      (not (= (image-width (first loi)) n))
      (not (= (image-height (first loi)) n)))
     (first loi)]
    [else (ill-sized? (rest loi) n)]))
