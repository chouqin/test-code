(define (safe? k positions)
  (iter-check 
    (car positions) 
    (cdr positions)
    1))

(define (iter-check new-row positions i)
  (if (null? positions)
    #t
    (let ((cur-row (car positions)))
      (if (or (= new-row cur-row) ; same row
              (= new-row (+ cur-row i)) ; same diagonal on top
              (= new-row (- cur-row i))) ; same diagonal on bottom
        #f
        (iter-check new-row (cdr positions) (+ i 1))))))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board '())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  
  (queen-cols board-size))

(for-each (lambda (x)
            (begin (display x)
                   (newline)))
          (queens 8))
