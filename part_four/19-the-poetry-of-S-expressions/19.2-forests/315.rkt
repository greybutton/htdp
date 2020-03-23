(require 2htdp/abstraction)

(define-struct no-parent [])
(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of: 
; – (make-no-parent)
; – (make-child FT FT String N String)

(define NP (make-no-parent))
; An FT is one of: 
; – NP
; – (make-child FT FT String N String)

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))
 
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))


; 315

(define YEAR 2020)

(check-expect
 (average-age-in-forest ff1 YEAR)
 (/
  (+
   (- YEAR (child-date Carl))
   (- YEAR (child-date Bettina)))
  2))
(check-expect
 (average-age-in-forest ff2 YEAR)
 (/
  (+
   (- YEAR (child-date Fred))
   (- YEAR (child-date Eva))
   (- YEAR (child-date Carl))
   (- YEAR (child-date Bettina)))
  4))

(define (average-age-in-forest forest present)
  (/ (foldl (lambda (x y) (+ (sum-age x present) y)) 0 forest)
     (foldl (lambda (x y) (+ (count-persons x) y)) 0 forest)))

(define (sum-age tree year)
  (match tree
    [(no-parent) 0]
    [(child father mother name date eyes)
     (+
      (- year date)
      (sum-age father year)
      (sum-age mother year))]))

(define (count-persons tree)
  (cond
    [(no-parent? tree) 0]
    [else (+ 1
             (count-persons (child-father tree))
             (count-persons (child-mother tree)))]))
