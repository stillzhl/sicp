(define (same-parity first . rest)
  (define (same-parity-iter source dist remainder-val)
    (if (null? source)
      dist
      (same-parity-iter (cdr source)
                        (if (= (remainder (car source) 2) remainder-val)
                          (append dist (list (car source)))
                          dist)
                        remainder-val)))
  (same-parity-iter rest (list first) (remainder first 2)))


(define (same-parity-better first . rest)
  (let ((r (remainder first 2)))
    (define (same-parity-iter source dist)
      (if (null? source)
        dist
        (same-parity-iter (cdr source)
                          (if (= (remainder (car source) 2) r)
                            (append dist (list (car source)))
                            dist)
                          )
        )
      )
    (same-parity-iter rest (list first))
    ))

(same-parity-better 1 2 3 4 5 6 7)
