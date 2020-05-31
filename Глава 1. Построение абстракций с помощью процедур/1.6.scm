#lang sicp

;; Упражнение 1.6
;; Лиза П. Хакер не понимает, почему if должна быть особой формой. "Почему
;; нельзя определить её как обычную процедуру с помощью cond?" - спрашивает она.
;; Лизина подруга Ева Лу Атор утверждает, что, разумеется, можно, и определяет
;; новую версию if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; Ева показывает Лизе новую программу:

(new-if (= 2 3) 0 5)
;; Output: 5

(new-if (= 1 1) 0 5)
;; Output: 0

;; Обрадованная Лиза переписывает через new-if программу вычисления квадратного
;; корня:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;; Что получится, когда Лиза попытается использовать эту процедуру для
;; вычисления квадратных корней? Объясните.

;; Решение:

;; Допишем определения недостающих процедур для вычисления квадратных корней

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Попытка вычисления квадратного корня при помощи новой процедуры (sqrt)
;; приводит к уходу интерпретатора в бесконечный цикл. Как это происходит:

;; В определении процедуры new-if используется cond вместо if.
;; Так как cond не является особой формой, при вычислении new-if применяется
;; аппликативный порядок вычислений и для вычисления результата требуется
;; вычислить все аргументы.

;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x)
;;                      x)))

;; Таким образом, мы столкнёмся с той же проблемой, что и в упражнении
;; 1.5 -- внутри определения функции(sqrt-iter) есть вызов самой функции
;; (sqrt-iter), что приводит к бесконечному циклу. Если бы
;; использовалась особая форма -- if, при вычислении ветвления,
;; интерпретатор считал бы только предикат и одну из ветвей, так что
;; вложенность рекурсии не была бы бесконечной.
