;(define (fold-left op initial sequence)
  ;(define (iter result rest)
    ;(if (null? rest)
        ;result
        ;(iter (op result (car rest))
              ;(cdr rest))))
  ;(iter initial sequence))

;(define (reverse sequence)
  ;(fold-left (lambda (x y) (cons y x))
             ;'() sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x)))
             '() sequence))

