; [List-of Number] -> Number
; computes the sum of 
; the numbers on l
(define (sum l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l)
        (sum (rest l)))]))

; [List-of Number] -> Number
; computes the product of 
; the numbers on l
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product (rest l)))]))



(define (fold1 f s l)
  (cond
    [(empty? l) s]
    [else
     (f (first l)
        (fold1 f s (rest l)))]))

(check-expect
 (sum '(1 2 3))
 6)
(check-expect
 (fold1 + 0 '(1 2 3))
 6)

(check-expect
 (product '(1 2 3))
 6)
(check-expect
 (fold1 * 1 '(1 2 3))
 6)
 