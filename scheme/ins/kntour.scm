(define (tryone move soln)
  ;(display soln)
  ;(newline)
  (let ((xsoln (proceed move soln)))
    ;(display xsoln)
    ;(newline)
    (if (valid move soln)
	(if (done xsoln)  (cons #t xsoln)
	    (try xsoln))
	(cons #f soln)
)))


(define (trywh move soln)
  ;(display soln)
  ;(newline)
  (if (and (hasmore move) (not (car soln)))
      (let ((atry (tryone move (cdr soln))))
	(if (car atry) atry (trywh (nextmove move) soln))
	)
      soln
))

(define (try soln) (trywh 0 (cons #f soln)))

;;; end general backtrack algorithm

;;; begin specialization for Knight's tour


;jumps type, total 8
(define jumps '((-2 1) (-1 2) (1 2) (2 1) (2 -1) (1 -2) (-1 -2) (-2 -1)))
(define JTOTAL 8)


(define (hasmore move) (< move JTOTAL))

(define (nextmove move) (+ move 1))

(define (done soln) (>= (length soln) (* N  N)))


(define N 5)

(define (valid move soln)
  (let ((next (map add (list-ref jumps move) (car soln))))
        ;(display (list? next))
        ;(newline)
        ;(display (cdr next))
        ;(newline)
        (and (and (and (>= (car next) 0) (< (car next) N)) (and (>= (cadr next) 0) (< (cadr next) N))) (not (member next soln)))
  )
)

(define (add a b)
    (+ a b)
)

(define (proceed move soln)
    (let ((list1 (list-ref jumps move)) (list2 (car soln)))
      ;(display list1)
      ;(newline)
      ;(display list2)
      ;(newline)
      ;(display (list? (map add list1 list2)))
      ;(newline)
      (cons (map add list1 list2) soln)
    )
)



(
    begin
    (let ((result (reverse (cdr (try '((0 0)))))))
        (display "the final result is: ")
        (newline)
        (display result)
        (newline)
    )
)
