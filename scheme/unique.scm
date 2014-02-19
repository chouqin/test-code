(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap
    (lambda (i)
      (map (lambda (pairs) (cons i pairs))
           (unique-pairs (- i 1))))
    (enumerate-interval 1 n)))

(define (sum-triples n s)
  (define (fix-sum? triple)
    (let ((a (car triple))
          (b (cadr triple))
          (c (cadr (cdr triple)))); or caddr
      (= (+ a b c) s)))
  ; fix-sum can also be defined by fold-right
  (filter fix-sum?
          (unique-triples n)))
