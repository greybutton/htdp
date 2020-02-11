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
(check-error
 (wage* (cons 100 '()))
 "wage: hour can't be more or equal 100")
(check-error
 (wage* (cons 4 (cons 100 '())))
 "wage: hour can't be more or equal 100")

(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [(>= (first whrs) 100) (error "wage: hour can't be more or equal 100")]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))
 
; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* WAGE h))
