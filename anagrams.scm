(define (rm-elm elm items acc) 
  (cond ((null? items) (reverse acc))
        ((eq? elm (car items)) (append (reverse acc) (cdr items)))
        (else (rm-elm elm (cdr items) (cons (car items) acc)))))

(define (rm-elms elm items acc) 
  (cond ((null? items) (reverse acc))
        ((eq? elm (car items)) (rm-elm elm (cdr items) acc))
        (else (rm-elm elm (cdr items) (cons (car items) acc)))))

(define (completeAnagrams start ending)
  (if (> (length ending) 0)
    (map (lambda (x) (completeAnagrams (cons x start) (rm-elm x ending '()))) ending)))
    ;(if (not (null? start)) (begin (display (list->string start)) (newline)))))

(completeAnagrams '() (string->list (list-ref (command-line) 1)))
