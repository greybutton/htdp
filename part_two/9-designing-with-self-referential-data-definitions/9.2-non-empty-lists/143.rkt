; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
 
; A CTemperature is a Number greater than -273.

; List-of-temperatures -> Number
; computes the average temperature

(check-expect
  (average (cons 1 (cons 2 (cons 3 '())))) 2)
(check-expect
 (checked-average (cons 1 (cons 2 (cons 3 '())))) 2)
(check-error
 (checked-average '()) "average: non empty expected")

(define (average alot)
  (/ (sum alot) (how-many alot)))

(define (checked-average alot)
  (cond
    [(empty? alot) (error "average: non empty expected")]
    [else (average alot)]))

; List-of-temperatures -> Number 
; adds up the temperatures on the given list

(check-expect (sum '()) 0)
(check-expect (sum (cons 1 '())) 1)
(check-expect
 (sum (cons 1 (cons 2 '()))) 3)

(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))
 
; List-of-temperatures -> Number 
; counts the temperatures on the given list 
(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [else (+ (how-many (rest alot)) 1)]))
