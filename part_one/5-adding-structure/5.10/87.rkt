(require 2htdp/image)
(require 2htdp/universe)

(define EMPTY-STRING "")
(define (string-empty? str)
  (equal? str EMPTY-STRING))

(define SCENE-WIDTH 200)
(define SCENE-HEIGHT 20)
(define BACK (empty-scene SCENE-WIDTH SCENE-HEIGHT))
(define CURSOR (rectangle 1 20 "solid" "red"))

(define-struct editor [str cur])
; An Editor is a structure:
;   (make-editor String Index)
; interpretation (make-editor s i) describes an editor
; whose visible text is str with 
; the cursor displayed at index

; editor -> Image
; renders the editor and places the cursor between editor-pre and editor-post
(define (render e) (overlay/align "left" "center"
                                  (beside (render-text
                                           (string-pre e))
                                          CURSOR
                                          (render-text
                                           (string-post e)))
                                  BACK))

; String -> Image
; renders the text
(define (render-text t) (text t 11 "black"))

(check-expect
 (render (make-editor "prepost" 3))
 (place-image/align (overlay/align "left" "center"
                             (beside (text "pre" 11 "black")
                                     CURSOR
                                     (text "post" 11 "black"))
                             BACK)
              0 0 "left" "top"
              BACK))


; Editor -> Number
; width of editor text
(define (text-width ed)
  (+
   (image-width (render-text (string-pre ed)))
   (image-width CURSOR)
   (image-width (render-text (string-post ed)))))

; Editor, KeyEvent -> Editor
; edit the text
(define (edit ed ke)
  (cond
    [(string=? "\t" ke) ed]
    [(string=? "\r" ke) ed]
    [(string=? "\b" ke) (bksp ed)]
    [(string=? "left" ke) (move-left ed)]
    [(string=? "right" ke) (move-right ed)]
    [(and
      (= (string-length ke) 1)
      (>= SCENE-WIDTH (text-width ed)))
     (insert-char ke ed)]
    [else ed]))

(check-expect (edit (make-editor "prepost" 3) "\b") (make-editor "prpost" 2))
(check-expect (edit (make-editor "prepost" 3) "\t") (make-editor "prepost" 3))
(check-expect (edit (make-editor "prepost" 3) "\r") (make-editor "prepost" 3))
(check-expect (edit (make-editor "prepost" 3) "up") (make-editor "prepost" 3))
(check-expect (edit (make-editor "prepost" 3) "left") (make-editor "prepost" 2))
(check-expect (edit (make-editor "prepost" 3) "right") (make-editor "prepost" 4))
(check-expect (edit (make-editor "prepost" 3) "A") (make-editor "preApost" 4))
(check-expect (edit (make-editor "prepost" 3) " ") (make-editor "pre post" 4))

(check-expect (edit (make-editor "post" 0) "\b") (make-editor "post" 0))
(check-expect (edit (make-editor "pre" 3) "\b") (make-editor "pr" 2))
(check-expect (edit (make-editor "post" 0) "left") (make-editor "post" 0))
(check-expect (edit (make-editor "pre" 3) "left") (make-editor "pre" 2))
(check-expect (edit (make-editor "pre" 3) "right") (make-editor "pre" 3))
(check-expect (edit (make-editor "post" 0) "right") (make-editor "post" 1))
(check-expect (edit (make-editor "pre" 3) "A") (make-editor "preA" 4))
(check-expect (edit (make-editor "post" 0) "A") (make-editor "Apost" 1))

; String -> Editor
; interpretation consumes string and renders new editor with the string as pre
; expect (run "hello ") -> render an editor with "hello " is shown with cursor after
(define (run str)
  (big-bang (make-editor str (string-length str))
    [to-draw render]
    [on-key edit]))


; Auxilairy editor

; String, Index -> String
; pre string
(define (string-pre ed)
  (if (string-empty? (editor-str ed))
      (editor-str ed)
      (substring (editor-str ed) 0 (editor-cur ed))))

(check-expect (string-pre (make-editor "prepost" 3)) "pre")
(check-expect (string-pre (make-editor "" 3)) "")

; String, Index -> String
; post string
(define (string-post ed)
  (if (string-empty? (editor-str ed))
      (editor-str ed)
      (substring (editor-str ed) (editor-cur ed))))

(check-expect (string-post (make-editor "prepost" 3)) "post")
(check-expect (string-post (make-editor "" 3)) "")

; Editor -> Index
(define (cursor-minus ed)
   (if (= 0 (editor-cur ed))
       0
       (- (editor-cur ed) 1)))

; Editor -> Index
(define (cursor-plus ed)
  (if (= (string-length (editor-str ed)) (editor-cur ed))
      (editor-cur ed)
      (+ (editor-cur ed) 1)))



; Auxiliary edit

; Editor -> Editor
(define (bksp ed)
  (make-editor
   (string-append
    (string-remove-last (string-pre ed))
    (string-post ed))
   (cursor-minus ed)))

(check-expect
 (bksp (make-editor "helloworld" 5))
 (make-editor "hellworld" 4))
(check-expect
 (bksp (make-editor "" 0))
 (make-editor "" 0))

; Editor -> Editor
; move cursor to left
(define (move-left ed)
  (make-editor
   (editor-str ed)
   (cursor-minus ed)))

(check-expect
 (move-left (make-editor "helloworld" 4))
 (make-editor "helloworld" 3))
(check-expect
 (move-left (make-editor "" 0))
 (make-editor "" 0))
(check-expect
 (move-left (make-editor "str" 0))
 (make-editor "str" 0))

; Editor -> Editor
; move cursor to right
(define (move-right ed)
  (make-editor
   (editor-str ed)
   (cursor-plus ed)))

(check-expect
 (move-right (make-editor "helloworld" 4))
 (make-editor "helloworld" 5))
(check-expect
 (move-right (make-editor "" 0))
 (make-editor "" 0))
(check-expect
 (move-right (make-editor "str" 3))
 (make-editor "str" 3))

; Editor -> Editor
; insert char
(define (insert-char char ed)
  (make-editor
   (string-append
    (string-pre ed)
    char
    (string-post ed))
   (+ (editor-cur ed) 1)))

(check-expect
 (insert-char "A" (make-editor "helloworld" 5))
 (make-editor "helloAworld" 6))
(check-expect
 (insert-char "A" (make-editor "helloworld" 0))
 (make-editor "Ahelloworld" 1))
(check-expect
 (insert-char "A" (make-editor "str" 3))
 (make-editor "strA" 4))



; Auxiliary string

; String -> String
; extract first letter of word
; given: hello, expect: h
; given: world, expect: w
(define (string-first str)
  (if (string-empty? str)
      str
      (substring str 0 1)))

(check-expect (string-first "hello") "h")
(check-expect (string-first "") "")


; String -> String
; remove first letter of a word
; given: hello, expect: ello
; given: world, expect: orld
(define (string-rest str)
  (if (string-empty? str)
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
  (if (string-empty? str)
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
  (if (string-empty? str)
      str
      (substring str
                 0
                 (- (string-length str) 1))))

(check-expect (string-remove-last "hello") "hell")
(check-expect (string-remove-last "") "")
