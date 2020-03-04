; Nelon -> Number
; determines the smallest 
; number on l
(define (inf l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (< (first l)
            (inf (rest l)))
         (first l)
         (inf (rest l)))]))

(check-expect
 (inf (list 25 24 23 22 21 20 19 18 17 16 15 14 13
      12 11 10 9 8 7 6 5 4 3 2 1))
 1)

; Nelon -> Number
; determines the largest 
; number on l
(define (sup l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (> (first l)
            (sup (rest l)))
         (first l)
         (sup (rest l)))]))

(check-expect
 (sup (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
      17 18 19 20 21 22 23 24 25))
 25)

 (define (extract-one R l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (R (first l)
            (extract-one R (rest l)))
         (first l)
         (extract-one R (rest l)))]))

(define (inf-1 l)
  (extract-one < l))

(define (sup-1 l)
  (extract-one > l))

(check-expect
 (inf-1 (list 25 24 23 22 21 20 19 18 17 16 15 14 13
      12 11 10 9 8 7 6 5 4 3 2 1))
 1)

(check-expect
 (sup-1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
      17 18 19 20 21 22 23 24 25))
 25)
