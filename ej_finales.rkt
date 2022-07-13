#lang racket

;comentarios

(define encabezado (list "Edad" "Pais" "Calorias" "Act_fisica" "Peso_real" "Peso_pre"))
(define data (list 
                   (list 24 "PER" 456 #t 78 77)
                   (list 33 "ARG" 344 #f 77 76)
                   (list 22 "PER" 555 #t 67 67)
                   (list 45 "PAR" 365 #t 88 86)
                   (list 43 "ECU" 434 #f 76 77)
                   (list 24 "PER" 323 #t 89 70)))

encabezado
data

;calcular pais de más calorías

(define paises '())

(define (Filtrar data pais)
  (map (lambda (persona)
                 (list (list-ref persona 1)
                       (list-ref persona 2)))
       (filter (lambda (persona)
       (equal? (list-ref persona 1) pais))
          data) 
  )
)

(define (SumarCal dataCalor sumatot)
  (if(empty? dataCalor)
     sumatot
     (SumarCal (cdr dataCalor)
               (+ (list-ref (car dataCalor) 1)
                  sumatot))
  )
)

(define (Mayor paisesCalor may pais)
  (if (empty? paisesCalor)
      (list pais may)
      (Mayor (cdr paisesCalor)
             (if (> (list-ref (car paisesCalor) 1)
                    may)
                 (list-ref (car paisesCalor) 1)
                 may)
             (if (> (list-ref (car paisesCalor) 1)
                    may)
                 (list-ref (car paisesCalor) 0)
                 pais)
             )
      )
)
(define (CalcularPais data)
  (Mayor (list (list "PER" (SumarCal (Filtrar data "PER") 0))
               (list "ARG" (SumarCal (Filtrar data "ARG") 0))
               (list "PAR" (SumarCal (Filtrar data "PAR") 0))
               (list "ECU" (SumarCal (Filtrar data "ECU") 0)))
  0 ""))

(Filtrar data "PER")
(CalcularPais data)

;funcion SSE  - suma de errores cuadraticos del peso

(define (error data)
  (map (lambda (persona)
         (expt (- (list-ref persona 4)
                  (list-ref persona 5)) 2)) data))

(define (sse-tail lista suma)
  (if (empty? lista)
      suma
      (sse-tail (cdr lista)
                (+ suma (car lista)))))

(define (sse data)
  (sse-tail (error data) 0))

(sse data)

(define posEjemplo (list 10 20)) ; (10, 20)

(define (Rotation posicion angulo)
  (list (- (* (list-ref posicion 0)
              (cos angulo))
           (* (list-ref posicion 1)
              (sin angulo)))
        (+ (* (list-ref posicion 0)
              (sin angulo))
           (* (list-ref posicion 1)
              (cos angulo)))))