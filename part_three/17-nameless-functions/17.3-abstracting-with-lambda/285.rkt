; $1 USD = 0.94 EUR
(define RATE 0.94)

; List-of-amounts Number -> List-of-amounts
; consumes a list of USD amounts and exchange rate, returns a list of amounts in EUR

(check-expect
 (convert-euro* '(1) RATE)
 (list (* 1 RATE)))

(define (convert-euro* loa xr)
  (map (lambda (n) (* RATE n)) loa))

; List-of-numbers -> List-of-numbers
; consumes a list of temp measurements in F, returns list of C temps

(check-expect
  (convertFC '(32))
  '(0))
(check-expect
  (convertFC '(100 200))
  (list (calc 100) (calc 200)))

(define (convertFC temps)
  (map (lambda (f) (/ (- f 32) 1.8)) temps))

(check-expect (calc 32) 0)
(check-expect (calc 212) 100)

(define (calc f)
  (/ (- f 32) 1.8))
