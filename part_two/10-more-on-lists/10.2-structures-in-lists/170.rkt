(define-struct phone [area switch four])
; A Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999.

(check-expect
 (replace
  (cons (make-phone 713 111 2222) '()))
  (cons (make-phone 281 111 2222) '()))
(check-expect
 (replace
  (cons (make-phone 000 111 2222) '()))
  (cons (make-phone 000 111 2222) '()))
(check-expect
 (replace
  (cons (make-phone 000 111 2222)
        (cons (make-phone 713 333 4444) '())))
  (cons (make-phone 000 111 2222)
        (cons (make-phone 281 333 4444) '())))

(define (replace lop)
  (cond
    [(empty? lop) '()]
    [else (cons (change-or-stay (first lop)) (replace (rest lop)))]))

(define (change-or-stay p)
  (make-phone
   (cond
     [(= 713 (phone-area p)) 281]
     [else (phone-area p)])
   (phone-switch p)
   (phone-four p)))
