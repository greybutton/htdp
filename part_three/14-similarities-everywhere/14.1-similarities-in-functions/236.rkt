; Lon -> Lon
; adds 1 to each item on l
(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (add1 (first l))
       (add1* (rest l)))]))

(check-expect
  (add1* '(1 2 3))
  '(2 3 4))

; Lon -> Lon
; adds 5 to each item on l
(define (plus5 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (+ (first l) 5)
       (plus5 (rest l)))]))

(check-expect
  (plus5 '(1 2 3))
  '(6 7 8))

; Number Lon -> Lon
; adds Number to each item on l
(define (add n l)
  (cond
    [(empty? l) '()]
    [else
      (cons
        (+ (first l) n)
        (add n (rest l)))]))

(define (add1*.v2 l)
  (add 1 l))

(check-expect
  (add1*.v2 '(1 2 3))
  '(2 3 4))

(define (plus5.v2 l)
  (add 5 l))

(check-expect
  (plus5.v2 '(1 2 3))
  '(6 7 8))
