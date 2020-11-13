; Fall 2020

; Husain Eftekher
; ehusain000@citymail.cuny.edu

;; 1.1 through 1.5, in Abelson and Sussman.


;Exercise 1.1:

(+ 5 3 4)
;5 + 3 + 4 = 12
; expected output: 12
(- 9 1)
; 9 - 1 : 8
; expected output: 8
(/ 6 2)
; 6 / 2 = 3
; expected output: 3
(+ (* 2 4) (- 4 6))
; 4 - 6 = -2
; 4 * 2 = 8
;8 + (-2) = 6
; expected output: 6 

(define a 3)
; a = 3

(define b (+ a 1))
; b = a + 1 = 3 + 1 = 4

(+ a b (* a b))
; a * b = 3 * 4 = 12
; a + b + 12 = 3 + 4 + 12 = 19

(= a b)
; 3 = 4 => false = #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; if b > a = if 4 > 3 = true = #t
; a * b = 3 * 4 = 12
; if b  < 12 = if 4 < 12 = true = #t
; if true and true = true
; if true than b
; else a
; ans is true so b => 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

; if a = 4 => 6
; a is not = 4 bcz a = 3 => false
; b = 4 => true => 6 + 7 + a = 13 + 3 = 16
; else 25
; since true so output is 16


(+ 2 (if (> b a) b a))
; if b > a => b
; 4 > 3 is true
; else a
; since #t so output is b = 4


(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

; if a > b then a == 3 > 4 == false so ignored
; if a < b then b == 3 < 4 == true so output is b = 4
; else -1 ignored
; a + 1 = 3 + 1 = 4
; b * 4 = 4 * 4 = 16

;Exercise 1.2:
; ((5 + 4 + (2 - (3 - (6 + (4/5)))))) / (3 * (6 -2)(2-7))

(/(+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))(* 3 (- 6 2)(- 2 7)))


;Exercise 1.3: Define a procedure that takes three numbers
;              as arguments and returns the sum of the squares of the two
;              larger numbers.

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

;(define (min x y) (if (< x y) x y))

;(define (max x y) (if (> x y) x y))

(define (sum-squares-2-biggest x y z)
  (sum-of-squares (max x y) (max z (min x y))))

(sum-squares-2-biggest 12 20 60)


;Exercise 1.4: Observe that our model of evaluation allows
;              for combinations whose operators are compound expressions.
;              Use this observation to describe the behavior of the
;              following procedure:


(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))


(a-plus-abs-b 4 5)
; if b > 0 = +
; (+ a b) = a + b = 4 + 5 = 9
; if b < 0 = -
; (- a b) = a - b = 4 -5 = -1
; since b is 5 and is greater than 0 ==> + -> 4 + 5 = 9 is output

;Exercise 1.5: Ben Bitdiddle has invented a test to determine
;              whether the interpreter he is faced with is using applicative order
;              evaluation or normal-order evaluation. He defines the
;              following two procedures:

(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))
;

; then he evaluates the expression

(test 0 (p))

;What behavior will Ben observe with an interpreter that
;uses applicative-order evaluation? What behavior will he
;observe with an interpreter that uses normal-order evaluation?
;Explain your answer. (Assume that the evaluation
;rule for the special form if is the same whether the interpreter
;is using normal or applicative order: the predicate
;expression is evaluated first, and the result determines
;whether to evaluate the consequent or the alternative expression.)

; p evaluates to itself
; if x = 0 return 0
; or else y
; for (test 0 (p)) x = 0 and y = (p)
; since x = 0 expected output is 0
;other wise p which has no value attached to it yet or itself

