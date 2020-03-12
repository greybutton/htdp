(check-expect
 (append-from-fold '(1 2) '(2 3))
 (append '(1 2) '(2 3)))

(define (append-from-fold l1 l2)
    (foldr cons l2 l1 ))

;; [List-of Number] -> Number
(check-expect (sum-from-fold '( 1 2)) 3)

(define (sum-from-fold l)
  (foldr + 0 l))

;; [List-of Number] -> Number
(check-expect (product-from-fold '( 1 2)) 2)

(define (product-from-fold l)
  (foldr * 1 l))
