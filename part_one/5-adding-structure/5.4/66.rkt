(define-struct movie [title producer year])

(define-struct person [name hair eyes phone])

(define-struct pet [name number])

(define-struct CD [artist title price])

(define-struct sweater [material size producer])

(make-movie "Batman" "Some human" 2000)
(make-person "John" "Blonde" "Green" 9123456789)
(make-pet "Thanos" 1)
(make-CD "6ix9ine" "Day in 69" 69)
(make-sweater "Cotton" "S" "Acne")
