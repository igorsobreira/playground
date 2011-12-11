;; Following SCIP book

;;
;; 1.1.5 The substitution model for procedure application
;;

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))


;; applicative order substitution model
(sum-of-squares (+ 5 1) (* 3 4))
(sum-of-squares 6 12)
(+ (square 6) (square 12))
(+ (* 6 6) (* 12 12))
(+ 36 144)
180

;; normal order substitution model
;; (fully expand and then reduce)
(sum-of-squares (+ 5 1) (- 10 2))
(+ (square (+ 5 1)) (square (- 10 2)))
(+ (* (+ 5 1) (+ 5 1)) (* (- 10 2) (- 10 2)))
(+ (* 6 6) (* 8 8))
(+ 36 64)
100

;;
;; Conditional Expressions and Predicates
;;

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))

(define (<x< gt x lt)
  (and (> x gt) (< x lt)))

(define (>= x y)
  (or (> x y) (= x y)))

(define (gt x y)
  (not (< x y)))


;; Exercise 1.2

(/ (+ 5 1 (- 2 (- 3 (+ 6 (/ 1 3)))))
   (* 3 (- 6 2) (- 2 7)))

;; Exercice 1.3

(define (largers-sum-of-square a b c)
  (cond ((and (> a b) (> a c) (> b c))
         (+ (square a) (square b)))
        ((and (> a b) (> a c) (> c b))
         (+ (square a) (square c)))
        ((and (> b a) (> b c) (> c a))
         (+ (square b) (square c)))
        ((and (> c b) (> c a) (> b a))
         (+ (square c) (square b)))
        ((and (> c a) (> c b) (> a b))
         (+ (square c) (square a)))))

(= 25 (largers-sum-of-square 4 3 2))
(= 25 (largers-sum-of-square 2 4 3))
(= 25 (largers-sum-of-square 2 3 4))
(= 25 (largers-sum-of-square 4 2 3))
(= 25 (largers-sum-of-square 3 2 4))

;; Exercice 1.4

(define (p)
  (p))

(define (test-substitution-model x y)
  (if (= x 0)
      0
      y))

(test-substitution-model 0 (p))         ; infinite loop

;; Square roots by Newton's appriximation method

(define (sqrt x)

  (define (abs x)
    (if (< x 0)
        (- x)
        x))

  (define (average x y)
    (/ (+ x y) 2))
  
  (define (square x)
    (* x x))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (define (good-enough? guess)
    (< (abs (- x (square guess))) 0.001))

  (define (improve guess)
    (average guess (/ x guess)))

  (sqrt-iter 1.0))

(sqrt 3)