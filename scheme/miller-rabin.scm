(define (expmod base exp m)
  (cond ((nontrival-square-root? base m) 0)
        (else (expmod-r base exp m))))

(define (expmod-r base exp m)
   (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod-r base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod-r base (- exp 1) m))
                    m))))

(define (nontrival-square-root? base m)
  (and (not (= base 1)) 
       (not (= base (- m 1)))
       (= (remainder (square base) m) 1)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (Miller-Rabin-test n)
    (let ((times (ceiling (/ n 2))))
        (fast-prime? n times)))
