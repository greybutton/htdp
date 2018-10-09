(define PEOPLE 120)
(define DEFAULT-TICKET-PRICE 5.0)
(define AVERAGE-CHANGE 15)
(define CHANGE-TICKET-PRICE 0.1)
(define PRICE-SENSITIVITY (/ AVERAGE-CHANGE CHANGE-TICKET-PRICE))
(define FIXED-COST 0)
(define VARIABLE-COST 1.50)

(define (attendees ticket-price)
  (- PEOPLE (*
             (- ticket-price DEFAULT-TICKET-PRICE)
             PRICE-SENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VARIABLE-COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
