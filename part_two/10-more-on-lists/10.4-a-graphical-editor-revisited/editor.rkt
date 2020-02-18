(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 20) ; the height of the editor 
(define WIDTH 200) ; its width 
(define FONT-SIZE 16) ; the font size 
(define FONT-COLOR "black") ; the font color 
 
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))

(define EMPTY-STRING "")
(define (empty-string? str)
  (equal? str EMPTY-STRING))



(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)



; Editor -> Image
; renders an editor as an image of the two texts 
; separated by the cursor 
(define (editor-render e)
  (place-image/align
    (beside (editor-text (reverse (editor-pre e)))
            CURSOR
            (editor-text (editor-post e)))
    1 1
    "left" "top"
    MT))



; Lo1s -> Image
; renders a list of 1Strings as a text image 
(define (editor-text s)
  (text (implode s) FONT-SIZE FONT-COLOR))

(check-expect
  (editor-text
   (cons "p" (cons "o" (cons "s" (cons "t" '())))))
  (text "post" FONT-SIZE FONT-COLOR))


 
; Editor KeyEvent -> Editor
; deals with a key event, given some editor
(define (editor-kh ed k)
  (cond
    [(key=? k "left") (editor-lft ed)]
    [(key=? k "right") (editor-rgt ed)]
    [(key=? k "\b") (editor-del ed)]
    [(key=? k "\t") ed]
    [(key=? k "\r") ed]
    [(= (string-length k) 1) (editor-ins ed k)]
    [else ed]))

(check-expect (editor-kh (create-editor "" "") "e")
              (create-editor "e" ""))
(check-expect
 (editor-kh (create-editor "cd" "fgh") "e")
 (create-editor "cde" "fgh"))



; insert the 1String k between pre and post
(define (editor-ins ed k)
  (make-editor (cons k (editor-pre ed))
               (editor-post ed)))

(check-expect
 (editor-ins (make-editor '() '()) "e")
 (make-editor (cons "e" '()) '()))
 
(check-expect
 (editor-ins
  (make-editor (cons "d" '())
               (cons "f" (cons "g" '())))
  "e")
 (make-editor (cons "e" (cons "d" '()))
               (cons "f" (cons "g" '()))))



; Editor -> Editor
; moves the cursor position one 1String left, 
; if possible 
(define (editor-lft ed)
  (if (empty? (editor-pre ed))
      ed
      (make-editor
       (rest (editor-pre ed))
       (cons
        (first (editor-pre ed))
        (editor-post ed)))))

(check-expect
 (editor-lft
  (make-editor
   (cons "e" (cons "d" '()))
   (cons "f" (cons "g" '()))))
 (make-editor
  (cons "d" '())
  (cons "e" (cons "f" (cons "g" '())))))

(check-expect
 (editor-lft
  (make-editor
   (cons "e" '())
   '()))
 (make-editor '() (cons "e" '())))

(check-expect
 (editor-lft
  (make-editor
   (cons "h" '())
   (cons "e" (cons "y" '()))))
 (make-editor '() (cons "h" (cons "e" (cons "y" '())))))

(check-expect
 (editor-lft
  (make-editor
   (cons "a" (cons "h" '()))
   '()))
 (make-editor (cons "h" '()) (cons "a" '())))

(check-expect
 (editor-lft
  (make-editor '() (cons "w" '())))
 (make-editor '() (cons "w" '())))



; Editor -> Editor
; moves the cursor position one 1String right, 
; if possible 
(define (editor-rgt ed)
  (if (empty? (editor-post ed))
      ed
      (make-editor
       (cons
        (first (editor-post ed))
        (editor-pre ed))
       (rest (editor-post ed)))))

(check-expect
 (editor-rgt
  (make-editor
   (cons "e" (cons "d" '()))
   (cons "f" (cons "g" '()))))
 (make-editor
  (cons "f" (cons "e" (cons "d" '())))
  (cons "g" '())))

(check-expect
 (editor-rgt
  (make-editor
   '()
   (cons "e" '())))
 (make-editor (cons "e" '()) '()))

(check-expect
 (editor-rgt
  (make-editor
   (cons "e" (cons "y" '()))
   (cons "h" '())))
 (make-editor (cons "h" (cons "e" (cons "y" '()))) '()))

(check-expect
 (editor-rgt
  (make-editor
   '()
   (cons "a" (cons "h" '()))))
 (make-editor (cons "a" '()) (cons "h" '())))

(check-expect
 (editor-rgt
  (make-editor (cons "w" '()) '()))
 (make-editor (cons "w" '()) '()))



; Editor -> Editor
; delete the cursor position one 1String left, 
; if possible 
(define (editor-del ed)
  (if (empty? (editor-pre ed))
      ed
      (make-editor
       (rest (editor-pre ed))
       (editor-post ed))))

(check-expect
 (editor-del
  (make-editor
   (cons "e" (cons "d" '()))
   (cons "f" (cons "g" '()))))
 (make-editor
  (cons "d" '())
  (cons "f" (cons "g" '()))))

(check-expect
 (editor-del
  (make-editor
   (cons "e" '())
   '()))
 (make-editor '() '()))

(check-expect
 (editor-del
  (make-editor
   (cons "h" '())
   (cons "e" (cons "y" '()))))
 (make-editor '() (cons "e" (cons "y" '()))))

(check-expect
 (editor-del
  (make-editor
   (cons "a" (cons "h" '()))
   '()))
 (make-editor (cons "h" '()) '()))

(check-expect
 (editor-del
  (make-editor '() (cons "w" '())))
 (make-editor '() (cons "w" '())))



; String, String -> Editor
(define (create-editor pre post)
  (make-editor
   (reverse (explode pre))
   (explode post)))

; main : String -> Editor
; launches the editor given some initial string 
(define (main s)
   (big-bang (create-editor s "")
     [on-key editor-kh]
     [to-draw editor-render]))



; Lo1s -> Lo1s 
; produces a reverse version of the given list 
 
(check-expect
  (rev (cons "a" (cons "b" (cons "c" '()))))
  (cons "c" (cons "b" (cons "a" '()))))

(define (rev l)
  (cond
    [(empty? l) '()]
    [else (add-at-end (rev (rest l)) (first l))]))

; Lo1s 1String -> Lo1s
; creates a new list by adding s to the end of l
 
(check-expect
  (add-at-end (cons "c" (cons "b" '())) "a")
  (cons "c" (cons "b" (cons "a" '()))))

(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else
     (cons (first l) (add-at-end (rest l) s))]))
