(define-struct gp [name score])
; A GamePlayer is a structure: 
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who 
; scored a maximum of s points

; List-of-GamePlayer -> List-of-GamePlayer
; rearranges alog in descending order

(check-expect (sort-gp '()) '())
(check-expect (sort-gp
               (list
                (make-gp "3" 3)
                (make-gp "2" 2)
                (make-gp "1" 1)))
              (list
               (make-gp "3" 3)
                (make-gp "2" 2)
                (make-gp "1" 1)))
(check-expect (sort-gp
               (list
                (make-gp "1" 1)
                (make-gp "2" 2)
                (make-gp "3" 3)))
              (list
               (make-gp "3" 3)
               (make-gp "2" 2)
               (make-gp "1" 1)))
(check-expect (sort-gp
               (list
                (make-gp "12" 12)
                (make-gp "20" 20)
                (make-gp "-5" 5)))
              (list
               (make-gp "20" 20)
               (make-gp "12" 12)
               (make-gp "-5" 5)))

(define (sort-gp l)
  (cond
    [(empty? l) '()]
    [(cons? l) (insert-gp (first l) (sort-gp (rest l)))]))

; GamePlayer List-of-GamePlayer -> List-of-GamePlayer
; inserts GamePlayer into the sorted list of alog

(define (insert-gp gp l)
  (cond
    [(empty? l) (cons gp '())]
    [else (if (>= (gp-score gp) (gp-score (first l)))
              (cons gp l)
              (cons (first l) (insert-gp gp (rest l))))]))
