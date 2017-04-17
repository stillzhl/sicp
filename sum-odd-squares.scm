(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

(define (odd? x) (= (remainder x 2) 1))

; enumerates the leaves of a tree;
; filters them, selecting the odd ones;
; squares each of the selected ones; and
; accumulates the results using +, starting with 0.

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (sum-odd-squares-conv tree)
  (accumulate
    + 0 (map square (filter odd? (enumerate-tree tree)))))
