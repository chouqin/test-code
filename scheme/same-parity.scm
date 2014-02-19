(define (parity? a b)
  (= (remainder a 2)(remainder b 2)))

(define (same-parity a . b)
   (get-same-parity a b))

(define (get-same-parity a b)
  (if (null? b) 
    '()
    (let ((first (car b)))
      (if (parity? first a)
        (cons first (get-same-parity a (cdr b)))
        (get-same-parity a (cdr b))))))
