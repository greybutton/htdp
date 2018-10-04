(define (==> sunny friday)
  (if (or (not sunny) friday) #true #false))

(==> #false #true)
(==> #true #false)
(==> #false #false)
(==> #true #true)
