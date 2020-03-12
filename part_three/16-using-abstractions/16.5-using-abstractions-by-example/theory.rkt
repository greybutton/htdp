; [List-of Posn] -> [List-of Posn]
; adds 3 to each x-coordinate on the given list 
 
(check-expect
 (add-3-to-all
   (list (make-posn 3 1) (make-posn 0 0)))
 (list (make-posn 6 1) (make-posn 3 0)))
 
(define (add-3-to-all lop)
  (local (; Posn -> Posn
          ; adds 3 to the x-coordinate of p
          (define (add-3-to-1 p)
            (make-posn (+ (posn-x p) 3) (posn-y p))))
    (map add-3-to-1 lop)))

; [List-of Posn] -> [List-of Posn]
; eliminates Posns whose y-coordinate is > 100
 
(check-expect
 (keep-good (list (make-posn 0 110) (make-posn 0 60)))
 (list (make-posn 0 60)))
 
(define (keep-good lop)
  (local (; Posn -> Posn
          ; should this Posn stay on the list
          (define (good? p)
            (< (posn-y p) 100)))
    (filter good? lop)))

; [List-of Posn] Posn -> Boolean
; is any Posn on lop close to pt
 
(check-expect
 (close? (list (make-posn 47 54) (make-posn 0 60))
         (make-posn 50 50))
 #true)
 
(define (close? lop pt)
  (local (; Posn -> Boolean
          ; is one shot close to pt
          (define (is-one-close? p)
            (close-to p pt CLOSENESS)))
    (ormap is-one-close? lop)))

(define CLOSENESS 5) ; in terms of pixels

; Posn Posn Number -> Boolean
; is the distance between p and q less than d
(define (close-to p q d)
  (and
   (< (abs (- (posn-x p) (posn-x q))) d)
   (< (abs (- (posn-y p) (posn-y q))) d)))
