
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
