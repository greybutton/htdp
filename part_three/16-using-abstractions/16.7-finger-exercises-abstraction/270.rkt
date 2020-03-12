; N -> [List-of N]
(check-expect (build-list1 3) '(0 1 2))

(define (build-list1 n)
  (local (
          (define (helper n)
            n))
    (build-list n helper)))

; N -> [List-of N]
(check-expect (build-list2 3) '(1 2 3))

(define (build-list2 n)
  (local (
          (define (helper n)
            (add1 n)))
    (build-list n helper)))

; N -> [List-of N]
(check-expect (build-list3 3) '(1 1/2 1/3))

(define (build-list3 n)
  (local (
          (define (helper n)
            (/ 1 (add1 n))))
    (build-list n helper)))

; N -> [List-of N]
(check-expect (build-list4 3) '(0 2 4))

(define (build-list4 n)
  (local (
          (define (helper n)
            (* 2 n)))
    (build-list n helper)))
