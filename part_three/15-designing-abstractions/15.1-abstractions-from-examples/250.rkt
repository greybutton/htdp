; Number -> [List-of Number]
; tabulates sin between n 
; and 0 (incl.) in a list
(define (tab-sin n)
  (cond
    [(= n 0) (list (sin 0))]
    [else
     (cons
      (sin n)
      (tab-sin (sub1 n)))]))

(check-expect
 (tab-sin 3)
 (list (sin 3) (sin 2) (sin 1) (sin 0)))
	
; Number -> [List-of Number]
; tabulates sqrt between n 
; and 0 (incl.) in a list
(define (tab-sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons
      (sqrt n)
      (tab-sqrt (sub1 n)))]))

(check-expect
 (tab-sqrt 3)
 (list (sqrt 3) (sqrt 2) (sqrt 1) (sqrt 0)))



(define (tabulate f n)
  (cond
    [(= n 0) (list (f 0))]
    [else
     (cons
      (f n)
      (tabulate f (sub1 n)))]))

(check-expect
 (tabulate sin 3)
 (list (sin 3) (sin 2) (sin 1) (sin 0)))



(define (tab-sqr n)
  (tabulate sqr n))

(define (tab-tan n)
  (tabulate tan ))
