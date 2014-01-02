(define (new-if predicate then-c else-c)
  (cond (predicate then-c)
        (else else-c)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (new-sqrt x)
  (sqrt-iter 1.0 x))
