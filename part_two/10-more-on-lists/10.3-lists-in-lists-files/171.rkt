(require 2htdp/batch-io)

(read-file "ttt.txt")

; List-of-lines
; (cons
;  "  TTT"
;  (cons
;   ""
;   (cons
;    "  "
;    (cons
;     ""
;     (cons
;      "  Put up in a place"
(read-lines "ttt.txt")

; List-of-words
; (cons "TTT"
;       (cons "Put"
;             (cons "up"
(read-words "ttt.txt")

; List-of-list-of-strings
; (cons
;  (cons "TTT" '())
;  (cons
;   '()
;   (cons
;    '()
;    (cons
;     '()
;     (cons
;      (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '())))))
(read-words/line "ttt.txt")
