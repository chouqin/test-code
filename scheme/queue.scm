(define (front-ptr queue) (car queue))

(define (rear-ptr queue) (cdr queue))

(define (set-front-ptr! queue item) (set-car! queue item))

(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
    (error "FRONT called with empty queue" queue)
    (car (front-queue queue))))

(define (insert-queue! queue item)
  (let ((new-item (cons item '()))) 
    (if (empty-queue? queue)
       (begin
         (set-front-ptr! queue new-item)
         (set-rear-ptr! queue new-item)
         queue
         )
       (begin
         (set-cdr! (rear-ptr queue) new-item)
         (set-rear-ptr! queue new-item)
         queue))))

(define (delete-queue! queue)
  (begin
    (set-front-ptr! queue (cdr (front-ptr queue)))
    ;(if (empty-queue? queue)
      ;(begin
        ;(set-rear-ptr! queue '())
        ;do))
    queue))

(define q1 (make-queue))

(insert-queue! q1 'a)

(insert-queue! q1 'b)

(delete-queue! q1)

(delete-queue! q1)
