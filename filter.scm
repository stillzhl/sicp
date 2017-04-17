(define (filter predicate sequence)
  (cond ((null? sequence) sequence)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))