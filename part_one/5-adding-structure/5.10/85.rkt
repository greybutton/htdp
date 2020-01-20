(require 2htdp/image)
(require 2htdp/universe)

(define EMPTY-STRING "")
(define (empty-string? str)
  (equal? str EMPTY-STRING))

(define BACK (empty-scene 200 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t



; editor -> Image
; renders the editor and places the cursor between editor-pre and editor-post
(define (render e) (overlay/align "left" "center"
                                  (beside (render-text (editor-pre e))
                                          CURSOR
                                          (render-text (editor-post e)))
                                  BACK))

; String -> Image
; renders the text
(define (render-text t) (text t 11 "black"))

(render (make-editor "pre" "post"))

(check-expect
 (render (make-editor "pre" "post"))
 (place-image/align (overlay/align "left" "center"
                             (beside (text "pre" 11 "black")
                                     CURSOR
                                     (text "post" 11 "black"))
                             BACK)
              0 0 "left" "top"
              BACK))

; Editor, KeyEvent -> Editor
; edit the text
(define (edit ed ke)
  (cond
    [(string=? "\t" ke) ed]
    [(string=? "\r" ke) ed]
    [(string=? "\b" ke) (bksp ed)]
    [(string=? "left" ke) (move-left ed)]
    [(string=? "right" ke) (move-right ed)]
    [(= (string-length ke) 1) (insert-char ke ed)]
    [else ed]))

(check-expect (edit (make-editor "pre" "post") "\b") (make-editor "pr" "post"))
(check-expect (edit (make-editor "pre" "post") "\t") (make-editor "pre" "post"))
(check-expect (edit (make-editor "pre" "post") "\r") (make-editor "pre" "post"))
(check-expect (edit (make-editor "pre" "post") "up") (make-editor "pre" "post"))
(check-expect (edit (make-editor "pre" "post") "left") (make-editor "pr" "epost"))
(check-expect (edit (make-editor "pre" "post") "right") (make-editor "prep" "ost"))
(check-expect (edit (make-editor "pre" "post") "A") (make-editor "preA" "post"))
(check-expect (edit (make-editor "pre" "post") " ") (make-editor "pre " "post"))

(check-expect (edit (make-editor "" "post") "\b") (make-editor "" "post"))
(check-expect (edit (make-editor "pre" "") "\b") (make-editor "pr" ""))
(check-expect (edit (make-editor "" "post") "left") (make-editor "" "post"))
(check-expect (edit (make-editor "pre" "") "left") (make-editor "pr" "e"))
(check-expect (edit (make-editor "pre" "") "right") (make-editor "pre" ""))
(check-expect (edit (make-editor "" "post") "right") (make-editor "p" "ost"))
(check-expect (edit (make-editor "pre" "") "A") (make-editor "preA" ""))
(check-expect (edit (make-editor "" "post") "A") (make-editor "A" "post"))

; String -> Editor
; interpretation consumes string and renders new editor with the string as pre
; expect (run "hello ") -> render an editor with "hello " is shown with cursor after
(define (run pre)
  (big-bang (make-editor pre "")
    [to-draw render]
    [on-key edit]))

; Auxiliary edit

; Editor -> Editor
(define (bksp ed)
  (make-editor
   (string-remove-last (editor-pre ed))
   (editor-post ed)))

(check-expect
 (bksp (make-editor "hello" "world"))
 (make-editor "hell" "world"))

; Editor -> Editor
; move cursor to left
(define (move-left ed)
  (make-editor
   (string-remove-last (editor-pre ed))
   (string-append
    (string-last (editor-pre ed))
    (editor-post ed))))

(check-expect
 (move-left (make-editor "hello" "world"))
 (make-editor "hell" "oworld"))

; Editor -> Editor
; move cursor to right
(define (move-right ed)
  (make-editor
   (string-append
    (editor-pre ed)
    (string-first (editor-post ed)))
   (string-rest (editor-post ed))))

(check-expect
 (move-right (make-editor "hello" "world"))
 (make-editor "hellow" "orld"))

; Editor -> Editor
; insert char
(define (insert-char char ed)
  (make-editor
   (string-append
    (editor-pre ed)
    char)
   (editor-post ed)))

(check-expect
 (insert-char "A" (make-editor "hello" "world"))
 (make-editor "helloA" "world"))



; Auxiliary string

; String -> String
; extract first letter of word
; given: hello, expect: h
; given: world, expect: w
(define (string-first str)
  (if (empty-string? str)
      str
      (substring str 0 1)))

(check-expect (string-first "hello") "h")
(check-expect (string-first "") "")


; String -> String
; remove first letter of a word
; given: hello, expect: ello
; given: world, expect: orld
(define (string-rest str)
  (if (empty-string? str)
      str
      (substring str
                 1
                 (string-length str))))

(check-expect (string-rest "hello") "ello")
(check-expect (string-rest "") "")

; String -> String
; extract last letter of word
; given: hello, expect: o
; given: world, expect: d
(define (string-last str)
  (if (empty-string? str)
      str
      (substring str
                 (- (string-length str) 1)
                 (string-length str))))

(check-expect (string-last "hello") "o")
(check-expect (string-last "") "")

; String -> String
; remove last letter of a word
; given: hello, expect: hell
; given: world, expect: worl
(define (string-remove-last str)
  (if (empty-string? str)
      str
      (substring str
                 0
                 (- (string-length str) 1))))

(check-expect (string-remove-last "hello") "hell")
(check-expect (string-remove-last "") "")
