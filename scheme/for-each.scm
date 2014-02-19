(define (for-each proc items)
  (if (not (null? items))
    (begin
     (proc (car items))
     (for-each proc (cdr items)))))

(for-each (lambda (x) (display x)(newline))
          (list 57 321 88))
