(require 2htdp/image)
(require 2htdp/universe)

(define-struct cat [x hap])
; A Cat is a structure:
;   (make-cat Number Number)
; interpretation (make-cat x h) describes a cat
; that is at x-position 'x' and has happiness level 'n'
