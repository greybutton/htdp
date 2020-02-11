; $1 USD = 0.94 EUR
(define RATE 0.94)

; List-of-amounts Number -> List-of-amounts
; consumes a list of USD amounts and exchange rate, returns a list of amounts in EUR

(check-expect
 (convert-euro* (cons 1 '()) RATE)
 (cons (* 1 RATE) '()))

(define (convert-euro* loa xr)
  (cond
    [(empty? loa) '()]
    [else (cons (* xr (first loa)) (convert-euro* (rest loa) xr))]))
