(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat-gcd n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((n-abs (abs n))
        (d-abs (abs d))
        (g (gcd (abs n) (abs d))))
  (if (or (and (> n 0) (> d 0)) (and (< n 0) (< d 0)))
    (cons (/ n-abs g) (/ d-abs g))
    (cons (- 0 (/ n-abs g)) (/ d-abs g)))))

(define one-half (make-rat -2 -4))
(print-rat one-half)
