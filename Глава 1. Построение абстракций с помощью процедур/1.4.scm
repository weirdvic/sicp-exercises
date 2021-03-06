#lang sicp

;; Упражнение 1.4
;; Заметим, что наша модель вычислений разрешает существование комбинаций,
;; операторы которых  -- составные выражения. С помощью этого наблюдения
;; опишите, как работает следующая процедура:

;; Решение:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Если b положительное число, блок if заменяется на + и таким образом
;; итоговое выражение вычисляется как
;; (+ a b)
;; В случае если b меньше (или равно), блок if возвращает минус и
;; мы вычисляем выражение
;; (- a b)
;; Так как b отрицательное, происходит вычитание отрицательного числа,
;; которое эквивалентно сложению.

(a-plus-abs-b 10 3)
;; b больше нуля, поэтому считаем
;; (+ 10 3)
;; Вывод: 13

(a-plus-abs-b 10 -3)
;; b меньше нуля, поэтому считаем
;; (- 10 -3)
;; Вывод: 13
