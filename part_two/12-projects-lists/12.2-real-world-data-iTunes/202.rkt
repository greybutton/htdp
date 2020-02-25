(require 2htdp/batch-io)
(require 2htdp/itunes)

(define BITCH-LASAGNA
  (create-track
   "bitch lasagna"
   "pewdiepie"
   "pewdiepie songs"
   135000
   1
   (create-date 2018 10 5 9 5 30)
   200000000
   (create-date 2020 2 24 9 5 30)))

(define CONGRATULATIONS
  (create-track
   "Congratulations"
   "pewdiepie"
   "pewdiepie songs"
   258000
   2
   (create-date 2018 3 31 9 8 30)
   200000000
   (create-date 2020 2 24 9 8 30)))

(define WAKE-UP-CALL
  (create-track
   "Wake up call"
   "ksi"
   "ksi songs"
   258000
   1
   (create-date 2020 2 1 9 8 30)
   200
   (create-date 2020 2 24 9 8 30)))
 
; String -> LTracks
; creates a list-of-tracks representation from the
; text in file-name (an XML export from iTunes)
; (define (read-itunes-as-tracks file-name))

; modify the following to use your chosen name
(define ITUNES-LOCATION "itunes.xml")
 
; LTracks
; (define itunes-tracks (read-itunes-as-tracks ITUNES-LOCATION))

; An LTracks is one of:
; – '()
; – (cons Track LTracks)

(define LTRACKS (list BITCH-LASAGNA CONGRATULATIONS WAKE-UP-CALL))

; String LTracks -> List
; extracts from the latter the list of tracks that belong to the given album
(define (select-album title lt)
  (select (list) title lt))

(define (select l title lt)
  (cond
    [(empty? lt) l]
    [(string=? title (track-album (first lt)))
     (select (append l (list (first lt))) title (rest lt))]
    [else (select l title (rest lt))]))
         
(check-expect
 (select-album "pewdiepie songs" LTRACKS)
 (list BITCH-LASAGNA CONGRATULATIONS))
(check-expect
 (select-album "test" LTRACKS)
 (list))
    
