(define (square x) (* x x))
(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                      (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree-map sub-tree)
           (square sub-tree)))
       tree))

(define (tree-map transform tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map transform sub-tree)
           (transform sub-tree)))
       tree))

(define (square-tree-map-transform tree)
  (tree-map square tree))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(square-tree-map
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
(square-tree-map-transform
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
