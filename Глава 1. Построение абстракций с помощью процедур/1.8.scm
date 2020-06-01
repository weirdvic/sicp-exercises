#lang sicp

;; Упражнение 1.7.

;; Метод Ньютона для кубических корней основан на том, что если y
;; является приближением к кубическому корню из x, то мы можем получить
;; лучшее приближение по формуле: y == (x/y^2+2*y)/3.  С помощью этой
;; формулы напишите процедуру вычисления кубического корня, подобную
;; процедуре для квадратного корня.

;; Решение:

(define (cubrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (cubrt-iter (improve guess x)
                     x)))

(define (improve guess x)
  (average (/ x (square guess)) (* 2 guess)))

(define (average x y)
  (/ (+ x y) 3))

(define (square x)
  (* x x))

(define (cubrt x)
  (cubrt-iter 1.0 x))

(define (good-enough? guess x)
  (= guess (improve guess x)))
