(define people 120)
(define default-ticket-price 5.0)
(define average-change 15)
(define change-ticket-price 0.1)
(define fixed-cost 0)
(define variable-cost 1.50)

(define (attendees ticket-price)
  (- people (*
             (- ticket-price default-ticket-price)
             (/ average-change change-ticket-price))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* variable-cost (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
