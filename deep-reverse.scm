(define (deep-reverse items)
  (cond ((null? items) items)
        ((pair? (car items))
         (append (deep-reverse (cdr items))
                 (list (deep-reverse (car items)))))
         (else 
           (append (deep-reverse (cdr items))
                   (list (car items))))))

(deep-reverse (list 1 2 3))
(deep-reverse (list (list 1 2) 12))
