; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

; NEList-of-temperatures -> Number
; computes the average temperature 
(check-expect (average (cons 1 (cons 2 (cons 3 '()))))
              2)
 
(define (average ne-l)
  (/ (sum ne-l)
     (how-many ne-l)))

; NEList-of-temperatures -> Number
; computes the sum of the given temperatures 
(check-expect
  (sum (cons 1 (cons 2 (cons 3 '())))) 6)

(define (sum ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) (sum (rest ne-l)))]))

; List-of-temperatures -> Number 
; counts the temperatures on the given list 
(define (how-many ne-l)
  (cond
    [(empty? (rest ne-l)) 1]
    [else (+ (how-many (rest ne-l)) 1)]))
