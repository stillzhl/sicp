(define (even-fibs n)
  (define (next k)
    (if (> k n)
      nil
      (let ((f (fib k)))
        (if (even? f)
          (cons f (next (+ k 1)))
          (next (+ k 1))))))
  (next 0))

; enumerates the integers from 0 to n;
; computes the Fibonacci number for each integer;
; filters them, selecting the even ones; and 
; accumulates the results using cons, starting with the empty list.

(define nil '())

(define (square x) (* x x))

(define (fib k)
  (cond ((= k 0) 0)
        ((= k 1) 1)
        (else (+ (fib (- k 1))
                 (fib (- k 2))))))

(define (even? x) (= (remainder x 2) 0))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (even-fibs-conv n)
  (accumulate
    cons nil (filter even? (map fib (enumerate-interval 0 n)))))

(define (list-fib-squares n)
  (accumulate cons nil (map square (map fib (enumerate-interval 0 n)))))

(define (product-of-squares-of-odd-elements sequence)
  (accumulate * 1 (map square (filter odd? sequence))))
(product-of-squares-of-odd-elements (list 1 2 3 4 5))

(define (salary-of-highest-paid-programmer records)
  (accumulate max 0 (map salary (filter programmer? records))))
