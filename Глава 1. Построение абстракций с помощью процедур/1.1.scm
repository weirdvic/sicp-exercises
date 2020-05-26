#lang sicp

;; Упражнение 1.1
;; Ниже приведена последовательность выражений. Какой результат напечатает
;; интерпретатор в ответ на каждое из них? Предполагается, что выражения
;; вводятся в том же порядке, в каком они написаны.

;; Решение:

10
;; Вывод: 10

(+ 5 3 4)
;; Вывод: 12

(- 9 1)
;; Вывод: 8

(/ 6 2)
;; Вывод: 3

(+ (* 2 4) (- 4 6))
;; Вывод: 6

(define a 3)
(define b (+ a 1))
(+ a b (* a b))
;; Вывод: 19

(= a b)
;; Вывод: #f (false)

(if (and (> b a)(< b (* a b)))
    b
    a)
;; Вывод: 4 (b)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;; Вывод: 16 (6 + 7 + 3)

(+ 2 (if (> b a) b a))
;; Вывод: 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;; Вывод: 16
