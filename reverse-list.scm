(define (reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items))
            (list (car items)))))

(reverse '())
(reverse (list 1 3 9 12))
