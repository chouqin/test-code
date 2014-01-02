(define (cont-frac n d k)
  ;(cont-frac-rec n d k 1))
  (cont-frac-iter n d k 0))

(define (cont-frac-rec n d k i)
  (cond ((= k i) (/ (n i) (d i)))
        (else (/ (n i) 
                 (+ (d i) 
                    (cont-frac-rec n d k (+ i 1)))))))

(define (cont-frac-iter n d i a)
  (if (= i 1)
    (/ (n i) (+ (d i) a))
    (cont-frac-iter n d (- i 1) (/ (n i) (+ (d i) a)))))

(define k 1000)

;(cont-frac (lambda (i) 1.0)
           ;(lambda (i) 1.0)
           ;k)

(define (get-d i)
  (let ((q (remainder i 3)) ; 余数
        (p (floor (/ i 3)))) ; 商
    (if (or (= 0 q) (= 1 q))
      1.0 
      (* 2.0 (+ p 1))
      )))  

(+ 2 
   (cont-frac (lambda (i) 1.0)
           get-d
           k))
