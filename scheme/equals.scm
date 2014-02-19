(define (equals li1 li2)
  ;(display (list li1 li2))
  ;(newline)
  (cond ((and (null? li1) (null? li2)) #t); finish compare return true
        ((or (null? li1) (null? li2)) #f); only one finish, return false
        (else 
          (let ((a1 (car li1))
                (a2 (car li2))) 
            (cond ((and (pair? a1) (pair? a2)) ; if all current item are list
                   (and (equals a1 a2)
                        (equals (cdr li1) (cdr li2))))
                  ((or (pair? a1) (pair? a2)) #f) ; only one current item are list
                  (else (and (eq? a1 a2)
                             (equals (cdr li1) (cdr li2))))
                  )))))

(display (equals '(this is a list) '(this is a list)))
(newline)
;(display "should print false")
;(newline)
(display (equals '(this is a list) '(this (is a) list)))
(newline)
