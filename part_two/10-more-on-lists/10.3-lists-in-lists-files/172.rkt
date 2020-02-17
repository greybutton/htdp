(require 2htdp/batch-io)

; An LLS is one of: 
; – '()
; – (cons Los LLS)
; interpretation a list of lines, each is a list of Strings
 
(define line0 (cons "hello" (cons "world" '())))
(define line1 '())
(define line2 (cons
               (cons "hello" '())
               (cons "world" '())))
                    
 
(define lls0 '())
(define lls1 (cons line0 (cons line1 '())))
 
; LLS -> List-of-numbers
; determines the number of words on each line 
 
(check-expect (words-on-line lls0) '())
(check-expect (words-on-line lls1) (cons 2 (cons 0 '())))
 
(define (words-on-line lls)
  (cond
    [(empty? lls) '()]
    [else (cons (length (first lls))
                (words-on-line (rest lls)))]))

; String -> List-of-numbers
; counts the words on each line in the given file
(define (file-statistic file-name)
  (words-on-line
    (read-words/line file-name)))

 
(define list0 (cons "hello" (cons "world" '())))
(define list1 '())
(define list2 (cons
               (cons "hello" '())
               (cons "world" '())))

; List-of-lines -> String
(check-expect (collapse list1) "\n")
(check-expect (collapse list0) "hello world \n")
; (check-expect (collapse list2) "hello \n world \n")

(define (collapse lol)
  (cond
    [(empty? lol) "\n"]
    [(empty? (rest lol)) (string-append (first lol) " \n")]
    ; [(string=? "" (first lol)) (string-append "\n" (collapse (rest lol)))]
    [else (string-append (first lol) " " (collapse (rest lol)))]))
