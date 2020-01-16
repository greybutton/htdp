(require 2htdp/image)

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

(define BACK (empty-scene 200 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

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
