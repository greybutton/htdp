(define WAGE 14)

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours

(check-expect (wage* '()) '())
(check-expect
 (wage* (cons 28 '()))
 (cons (wage 28) '()))
(check-expect
 (wage* (cons 4 (cons 2 '())))
 (cons (wage 4) (cons (wage 2) '())))

(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))
 
; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* WAGE h))
