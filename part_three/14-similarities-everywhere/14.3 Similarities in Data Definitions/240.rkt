(define-struct layer [stuff])

; An LStr is one of: 
; – String
; – (make-layer LStr)
	
; LStr
(define some-lstr "hello")
(define another-lstr (make-layer "wow"))
(define yet-another-lstr (make-layer some-lstr))

; An LNum is one of: 
; – Number
; – (make-layer LNum)

; LNum
(define some-lnum 99)
(define another-lnum (make-layer 101))
(define yet-another-lnum (make-layer some-lnum))

;; A LItm is one of:
;; - ITEM
;; - (make-layer LItm)
(define some-item "99")
(define another-item (make-layer "wow"))
(define yet-another-item (make-layer some-item))
