#lang racket
((lambda (n1 n2) (+ n1 n2)) 4 5)

(define nums '(1 3 5))

;(define (cuadrado x) (* x x))
;conviene poner lambda para funciones de un solo uso
(map (lambda (a) (* a a)) nums)


(define (cuadrado x)
  (* x x))
 
(define lista '(1 3 5))
 
(define alumnos (list (list "Luciana" 20)
                      (list "Jairo" 29)))
 
(define (birthday a)
  (list (car a)
        (+ 1 (list-ref a 1))))
 
(define new_alumnos (map birthday alumnos))
 
;------- implementar una funcion
;------- argumento: lista alumnos
;------- salida: promedio de notas
 
(define alumnos1 (list (list "Luciana" 20 15)
                      (list "Ana" 20 17)
                      (list "Caro" 18 0)))
 
 
(define (prom lista)
  (list (car lista)
        (/ (+ (list-ref lista 1) (list-ref lista 2)) 2)
  )
)
 
(define (conv_proms avr)
  (list (car avr)
        (exact->inexact (list-ref avr 1)))
)
 
(define promedios (map conv_proms (map prom alumnos1)))
promedios
 
;----------- funcion
;----------- entrada: lista alumnos
;----------- salida: alumnos aprovados
 
 
(define (aprovados a)
  (>= (list-ref a 1) 10.5) 
)
 
(define (tr a)
  (list (car a))
)
 
;(define al (filter aprovados promedios))
(define al (map (lambda (a) (list (car a)))
                (filter (lambda (aprov)
                          (>= (list-ref aprov 1) 10.5)) promedios)))
al