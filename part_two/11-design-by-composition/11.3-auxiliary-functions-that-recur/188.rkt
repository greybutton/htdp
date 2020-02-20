
(define-struct email [from date message])
; An Email Message is a structure: 
;   (make-email String Number String)
; interpretation (make-email f d m) represents text m 
; sent by f, d seconds after the beginning of time

; List-of-Email -> List-of-Email
; rearranges aloe in descending order

(check-expect (sort-email-name '()) '())
(check-expect (sort-email-name
               (list
                (make-email "Wade" 3 "Hi")
                (make-email "Sabrina" 2 "Hi")
                (make-email "Alex" 1 "Hi")))
              (list
               (make-email "Wade" 3 "Hi")
               (make-email "Sabrina" 2 "Hi")
               (make-email "Alex" 1 "Hi")))
(check-expect (sort-email-name
               (list
                (make-email "Alex" 1 "Hi")
                (make-email "Sabrina" 2 "Hi")
                (make-email "Wade" 3 "Hi")))
              (list
               (make-email "Wade" 3 "Hi")
               (make-email "Sabrina" 2 "Hi")
               (make-email "Alex" 1 "Hi")))
(check-expect (sort-email-name
               (list
                (make-email "Sabrina" 2 "Hi")
                (make-email "Wade" 3 "Hi")
                (make-email "Alex" 1 "Hi")))
              (list
               (make-email "Wade" 3 "Hi")
               (make-email "Sabrina" 2 "Hi")
               (make-email "Alex" 1 "Hi")))

(define (sort-email-name l)
    (cond
    [(empty? l) '()]
    [(cons? l) (insert-email-name (first l) (sort-email-name (rest l)))]))

(define (insert-email-name email l)
  (cond
    [(empty? l) (cons email '())]
    [else (if (string>? (email-from email) (email-from (first l)))
              (cons email l)
              (cons (first l) (insert-email-name email (rest l))))]))
