; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item

(define LOW-TAX 0.05)
(define LUXURY-TAX 0.08)
(define LOW-BOUNDARY 1000)
(define LUXURY-BOUNDARY 10000)

; Price -> Number
; computes the amount of tax charged for p
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p LOW-BOUNDARY)) 0]
    [(and (<= LOW-BOUNDARY p) (< p LUXURY-BOUNDARY)) (* LOW-TAX p)]
    [(>= p LUXURY-BOUNDARY) (* LUXURY-TAX p)]))

(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* LOW-TAX 1000))
(check-expect (sales-tax 1282) (* LOW-TAX 1282))
(check-expect (sales-tax 10000) (* LUXURY-TAX 10000))
(check-expect (sales-tax 12017) (* LUXURY-TAX 12017))
