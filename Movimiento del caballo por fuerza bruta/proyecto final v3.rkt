#lang racket
;Algoritmo del recorrido de un caballo de ajedrez en tablero de 5x5
;Universidad Tecnológica de Pereira
;Realizado por: Juan Pablo Cataño Osorio y Oscar Julian Ortega
(require (lib "graphics.ss" "graphics"))

(open-graphics)
;se define la primer ventana en ser visualizada y se muestra la imagen de inicio
(define ventana-principal(open-viewport "Principal" 1000 600))
(((draw-pixmap-posn "inicio.png" 'unknown/mask) ventana-principal) (make-posn 0 0))

(define (nclick);funcion para validar el click
  (define click (get-mouse-click ventana-principal))
  (inicio click)
  )

(define (inicio c);cuando se da click en inicio se muestra la imagen de explicacion y comienza a correr el programa
  (if (and (and (>= (posn-x (mouse-click-posn c)) 377) (>= (posn-y (mouse-click-posn c)) 365)) (and (<= (posn-x (mouse-click-posn c)) 627) (<= (posn-y (mouse-click-posn c)) 452)))
      (begin
        (((draw-pixmap-posn "explicacion.png" 'unknown/mask) ventana-principal) (make-posn 0 0))
        (sleep 15)
        (close-viewport ventana-principal)
        )
      (begin
        (nclick))))

(inicio (get-mouse-click ventana-principal));llamado a la funcion que espera el click de inicio

;---------------------------ventana de configuraciones------------------------------
(define ventana-configuraciones (open-viewport "Configuraciones" 800 600))
((draw-viewport ventana-configuraciones) "gainsboro")
(((draw-pixmap-posn "configuraciones.png" 'unknown/mask) ventana-configuraciones) (make-posn 20 0))

;----------Dibujo de las opciones de colores para el tablero de ajedrez
((draw-string ventana-configuraciones) (make-posn 75 200) "OPCIÓN 1:" "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 65 245) 100 100 "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 70 250) 45 45 "beige")
((draw-solid-rectangle ventana-configuraciones) (make-posn 115 250) 45 45 "DarkRed")
((draw-solid-rectangle ventana-configuraciones) (make-posn 70 295) 45 45 "DarkRed")
((draw-solid-rectangle ventana-configuraciones) (make-posn 115 295) 45 45 "beige")

((draw-string ventana-configuraciones) (make-posn 350 200) "OPCIÓN 2:" "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 340 245) 100 100 "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 345 250) 45 45 "beige")
((draw-solid-rectangle ventana-configuraciones) (make-posn 390 250) 45 45 "greenyellow")
((draw-solid-rectangle ventana-configuraciones) (make-posn 345 295) 45 45 "greenyellow")
((draw-solid-rectangle ventana-configuraciones) (make-posn 390 295) 45 45 "beige")

((draw-string ventana-configuraciones) (make-posn 600 200) "OPCIÓN 3:" "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 590 245) 100 100 "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 595 250) 45 45 "beige")
((draw-solid-rectangle ventana-configuraciones) (make-posn 640 250) 45 45 "blue")
((draw-solid-rectangle ventana-configuraciones) (make-posn 595 295) 45 45 "blue")
((draw-solid-rectangle ventana-configuraciones) (make-posn 640 295) 45 45 "beige")

((draw-string ventana-configuraciones) (make-posn 75 400) "OPCIÓN 4:" "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 65 445) 100 100 "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 70 450) 45 45 "beige")
((draw-solid-rectangle ventana-configuraciones) (make-posn 115 450) 45 45 "orange")
((draw-solid-rectangle ventana-configuraciones) (make-posn 70 495) 45 45 "orange")
((draw-solid-rectangle ventana-configuraciones) (make-posn 115 495) 45 45 "beige")

((draw-string ventana-configuraciones) (make-posn 350 400) "OPCIÓN 5:" "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 340 445) 100 100 "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 345 450) 45 45 "beige")
((draw-solid-rectangle ventana-configuraciones) (make-posn 390 450) 45 45 "blueviolet")
((draw-solid-rectangle ventana-configuraciones) (make-posn 345 495) 45 45 "blueviolet")
((draw-solid-rectangle ventana-configuraciones) (make-posn 390 495) 45 45 "beige")

((draw-string ventana-configuraciones) (make-posn 600 400) "OPCIÓN 6:" "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 590 445) 100 100 "black")
((draw-solid-rectangle ventana-configuraciones) (make-posn 595 450) 45 45 "beige")
((draw-solid-rectangle ventana-configuraciones) (make-posn 640 450) 45 45 "brown")
((draw-solid-rectangle ventana-configuraciones) (make-posn 595 495) 45 45 "brown")
((draw-solid-rectangle ventana-configuraciones) (make-posn 640 495) 45 45 "beige")

;paleta de colores para dibujar el tablero
(define (colores x)
  (cond ((= x 1) "DarkRed")
        ((= x 2) "greenyellow")
        ((= x 3) "blue")
        ((= x 4) "orange")
        ((= x 5) "blueviolet")
        ((= x 6) "brown")))

;se define una funcion para la verificacion del click para la seleccion del colores
(define (cclick)
  (define color-click (get-mouse-click ventana-configuraciones))
  (tono color-click))
;se dibujan las X al lado de las opciones de colores
(define (chulosrojos)
  (begin
    (((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones) (make-posn 165 245))
    (((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones) (make-posn 445 245))
    (((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones) (make-posn 695 245))
    (((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones) (make-posn 165 445))
    (((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones) (make-posn 445 445))
    (((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones) (make-posn 695 445))
    ))

(chulosrojos);llamado a la funcion de las X

;se define una funcion que verifica la opcion que se escoge mediante el click
(define (tono click)
  (if (and (and (>= (posn-x (mouse-click-posn click)) 65) (>= (posn-y (mouse-click-posn click)) 245)) (and (<= (posn-x (mouse-click-posn click)) 165) (<= (posn-y (mouse-click-posn click)) 345)))
      (begin
        ((draw-solid-rectangle ventana-configuraciones) (make-posn 165 245) 30 30 "gainsboro")
        (sleep 0.1)
        (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones) (make-posn 155 245))
        (sleep 3)
        (close-viewport ventana-configuraciones)
        1)
      (if (and (and (>= (posn-x (mouse-click-posn click)) 340) (>= (posn-y (mouse-click-posn click)) 245)) (and (<= (posn-x (mouse-click-posn click)) 440) (<= (posn-y (mouse-click-posn click)) 345)))
          (begin
            ((draw-solid-rectangle ventana-configuraciones) (make-posn 445 245) 30 30 "gainsboro")
            (sleep 0.1)
            (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones) (make-posn 445 245))
            (sleep 3)
            (close-viewport ventana-configuraciones)
            2)
          (if (and (and (>= (posn-x (mouse-click-posn click)) 590) (>= (posn-y (mouse-click-posn click)) 245)) (and (<= (posn-x (mouse-click-posn click)) 690) (<= (posn-y (mouse-click-posn click)) 345)))
              (begin
                ((draw-solid-rectangle ventana-configuraciones) (make-posn 695 245) 30 30 "gainsboro")
                (sleep 0.1)
                (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones) (make-posn 695 245))
                (sleep 3)
                (close-viewport ventana-configuraciones)
                3)
              (if (and (and (>= (posn-x (mouse-click-posn click)) 65) (>= (posn-y (mouse-click-posn click)) 445)) (and (<= (posn-x (mouse-click-posn click)) 165) (<= (posn-y (mouse-click-posn click)) 545)))
                  (begin
                    ((draw-solid-rectangle ventana-configuraciones) (make-posn 165 445) 30 30 "gainsboro")
                    (sleep 0.1)
                    (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones) (make-posn 155 445))
                    (sleep 3)
                    (close-viewport ventana-configuraciones)
                    4)
                  (if (and (and (>= (posn-x (mouse-click-posn click)) 340) (>= (posn-y (mouse-click-posn click)) 445)) (and (<= (posn-x (mouse-click-posn click)) 440) (<= (posn-y (mouse-click-posn click)) 545)))
                      (begin
                        ((draw-solid-rectangle ventana-configuraciones) (make-posn 445 445) 30 30 "gainsboro")
                        (sleep 0.1)
                        (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones) (make-posn 445 445))
                        (sleep 3)
                        (close-viewport ventana-configuraciones)
                        5)
                      (if (and (and (>= (posn-x (mouse-click-posn click)) 590) (>= (posn-y (mouse-click-posn click)) 445)) (and (<= (posn-x (mouse-click-posn click)) 690) (<= (posn-y (mouse-click-posn click)) 545)))
                          (begin
                            ((draw-solid-rectangle ventana-configuraciones) (make-posn 695 445) 30 30 "gainsboro")
                            (sleep 0.1)
                            (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones) (make-posn 695 445))
                            (sleep 3)
                            (close-viewport ventana-configuraciones)
                            6)
                          (cclick))))))))


;------------------------funciones para la seleccion del color del caballo------------------
(define color (tono (get-mouse-click ventana-configuraciones)));;llamado de la funcion

(define ventana-configuraciones2 (open-viewport "Color Caballo" 800 400))

((draw-viewport ventana-configuraciones2) "gainsboro")

(define (cclick2)
  (define color-click (get-mouse-click ventana-configuraciones2))
  (tono color-click))

(((draw-pixmap-posn "configuraciones.png" 'unknown/mask) ventana-configuraciones2) (make-posn 20 0))
((draw-string ventana-configuraciones2) (make-posn 100 190) "CABALLO 1: ")
((draw-string ventana-configuraciones2) (make-posn 500 190) "CABALLO 2: ")
(((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones2) (make-posn 200 210))
(((draw-pixmap-posn "xroja.png" 'unknown/mask) ventana-configuraciones2) (make-posn 600 210))
(((draw-pixmap-posn "caballo3.png" 'unknown/mask) ventana-configuraciones2) (make-posn 100 210))
(((draw-pixmap-posn "caballo4.png" 'unknown/mask) ventana-configuraciones2) (make-posn 500 210))

(define (tcaballo x)
  (cond ((= x 1) "caballo3.png")
        ((= x 2) "caballo4.png")))

(define (ccaballo click)
  (if (and (and (>= (posn-x (mouse-click-posn click)) 100) (>= (posn-y (mouse-click-posn click)) 190)) (and (<= (posn-x (mouse-click-posn click)) 200) (<= (posn-y (mouse-click-posn click)) 290)))
      (begin
        ((draw-solid-rectangle ventana-configuraciones2) (make-posn 200 210) 30 30 "gainsboro")
        (sleep 0.1)
        (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones2) (make-posn 200 210))
        (sleep 3)
        (close-viewport ventana-configuraciones2)
        1)
      (if (and (and (>= (posn-x (mouse-click-posn click)) 500) (>= (posn-y (mouse-click-posn click)) 190)) (and (<= (posn-x (mouse-click-posn click)) 600) (<= (posn-y (mouse-click-posn click)) 290)))
          (begin
            ((draw-solid-rectangle ventana-configuraciones2) (make-posn 600 210) 30 30 "gainsboro")
            (sleep 0.1)
            (((draw-pixmap-posn "chulo.png" 'unknown/mask) ventana-configuraciones2) (make-posn 600 210))
            (sleep 3)
            (close-viewport ventana-configuraciones2)
            2)
          (cclick2))))

(define color-caballo (tcaballo (ccaballo (get-mouse-click ventana-configuraciones2))))
;-------------------------------------------------------------------------------------------------------------------------

;-----------------------------------------Inicio ventana del recorrido----------------------------------------------------
(define ventana1(open-viewport "Caballo" 800 600))

;_____________________________________________
;titulos en el recorrido
((draw-viewport ventana1) "DarkGray")
((draw-string ventana1) (make-posn 50 15) "RECORRIDO DEL CABALLO POR FUERZA BRUTA-UNIVERSIDAD TECNOLÓGICA DE PEREIRA" "black")
((draw-string ventana1) (make-posn 200 35) "Juan Pablo Cataño Osorio - Oscar Julian Ortega")
((draw-string ventana1) (make-posn 70 100) "Caballo seleccionado: ")
(((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn 120 110))
(((draw-pixmap-posn "logo.png" 'unknown/mask) ventana1) (make-posn 50 375))
;_____________________________________________

(define (tablero x y c);dibujo del tablero de ajedrez
  ((draw-solid-rectangle ventana1) (make-posn 295 95) (+ 10 (* x 5)) (+ 10 (* y 5)) "black")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 0)) 100) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 1)) 100) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 2)) 100) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 3)) 100) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 4)) 100) x y "beige")

  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 0)) (+ 100 (* y 1))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 1)) (+ 100 (* y 1))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 2)) (+ 100 (* y 1))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 3)) (+ 100 (* y 1))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 4)) (+ 100 (* y 1))) x y (colores c))

  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 0)) (+ 100 (* y 2))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 1)) (+ 100 (* y 2))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 2)) (+ 100 (* y 2))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 3)) (+ 100 (* y 2))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 4)) (+ 100 (* y 2))) x y "beige")

  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 0)) (+ 100 (* y 3))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 1)) (+ 100 (* y 3))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 2)) (+ 100 (* y 3))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 3)) (+ 100 (* y 3))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 4)) (+ 100 (* y 3))) x y (colores c))

  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 0)) (+ 100 (* y 4))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 1)) (+ 100 (* y 4))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 2)) (+ 100 (* y 4))) x y "beige")
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 3)) (+ 100 (* y 4))) x y (colores c))
  ((draw-solid-rectangle ventana1) (make-posn (+ 300 (* x 4)) (+ 100 (* y 4))) x y "beige")
  
  )

(tablero 90 90 color);llamado al tablero para que se dibuje

;_________________
;limites del tablero
(define posn1x 300)
(define posn2x 750)
(define posn1y 100)
(define posn2y 550)
;320 110
;__________________

;posicion inicial del caballo
;para que el caballo inicie desde cualquier posicion es necesario tener en cuenta
;estas tablas:
;███████████████████████████  ███████████████████████████ Seguna la posicion
;█  x  │320│410│500│590│680█  █  x  │ 0 │ 1 │ 2 │ 3 │ 4 █ Deseada para que el
;█  y  │110│110│110│110│110█  █  y  │   │   │   │   │   █ Caballo empiece el 
;█-------------------------█  █-------------------------█ Recorrido se deben
;█  x  │320│410│500│590│680█  █  x  │ 5 │ 6 │ 7 │ 8 │ 9 █ Modificar los valores
;█  y  │200│200│200│200│200█  █  y  │   │   │   │   │   █ de las funciones
;█-------------------------█  █-------------------------█ Inmediatamente a 
;█  x  │320│410│500│590│680█  █  x  │ 10│ 11│ 12│ 13│ 14█ Continuación
;█  y  │290│290│290│290│290█  █  y  │   │   │   │   │   █ 
;█-------------------------█  █-------------------------█
;█  x  │320│410│500│590│680█  █  x  │ 15│ 16│ 17│ 18│ 19█
;█  y  │380│380│380│380│380█  █  y  │   │   │   │   │   █
;█-------------------------█  █-------------------------█
;█  x  │320│410│500│590│680█  █  x  │ 20│ 21│ 22│ 23│ 24█
;█  y  │470│470│470│470│470█  █  y  │   │   │   │   │   █
;███████████████████████████  ███████████████████████████
;Ejemplo:
;Si se desea empezar en la posicion 19 entonces las funciones
;quedarian así:
;(define xinicio 680)<--- estos valores corresponden a la posicion 19
;(define yinicio 380)<--- estos valores corresponden a la posicion 19
;(define x 680)<--- estos valores corresponden a la posicion 19
;(define y 380)<--- estos valores corresponden a la posicion 19
;(define posinicial 18)<------ posicion

(define xinicio 320)
(define yinicio 110)
(define x 320)
(define y 110)
(define posinicial 0)

(define (caballo x y)
  (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn x y))
  )

(caballo xinicio yinicio)
;___________________________________________________________________-


;------------------------Movimientos del caballo----------------------------------------
(define (mov1caballo x y posnx posny)
  (if (< (+ x 90) posnx)
      (if (> (- y 180) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (+ x 90) (- y 180)))
            (escoger-movimiento (+ (random 8) 1) (+ x 90) (- y 180) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov1caballo x y posn2x posn1y)


(define (mov2caballo x y posnx posny)
  (if (< (+ x 180) posnx)
      (if (> (- y 90) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (+ x 180) (- y 90)))
            (escoger-movimiento (+ (random 8) 1) (+ x 180) (- y 90) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov2caballo x y posn2x posn1y)


(define (mov3caballo x y posnx posny)
  (if (< (+ x 180) posnx)
      (if (< (+ y 90) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (+ x 180) (+ y 90)))
            (escoger-movimiento (+ (random 8) 1) (+ x 180) (+ y 90) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov3caballo x y posn2x posn2y)


(define (mov4caballo x y posnx posny)
  (if (< (+ x 90) posnx)
      (if (< (+ y 180) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (+ x 90) (+ y 180)))
            (escoger-movimiento (+ (random 8) 1) (+ x 90) (+ y 180) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov4caballo x y posn2x posn2y)


(define (mov5caballo x y posnx posny)
  (if (> (- x 90) posnx)
      (if (< (+ y 180) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (- x 90) (+ y 180)))
            (escoger-movimiento (+ (random 8) 1) (- x 90) (+ y 180) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov5caballo x y posn1x posn2y)


(define (mov6caballo x y posnx posny)
  (if (> (- x 180) posnx)
      (if (< (+ y 90) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (- x 180) (+ y 90)))
            (escoger-movimiento (+ (random 8) 1) (- x 180) (+ y 90) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov6caballo x y posn1x posn2y)


(define (mov7caballo x y posnx posny)
  (if (> (- x 180) posnx)
      (if (> (- y 90) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (- x 180) (- y 90)))
            (escoger-movimiento (+ (random 8) 1) (- x 180) (- y 90) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov7caballo x y posn1x posn1y)


(define (mov8caballo x y posnx posny)
  (if (> (- x 90) posnx)
      (if (> (- y 180) posny)
          (begin
            (sleep 2)
            (((draw-pixmap-posn "xa.png" 'unknown/mask) ventana1) (make-posn (- x 15) (- y 5)))
            (((draw-pixmap-posn color-caballo 'unknown/mask) ventana1) (make-posn (- x 90) (- y 180)))
            (escoger-movimiento (+ (random 8) 1) (- x 90) (- y 180) posn1x posn1y posn2x posn2y)
          )
          (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y))
      (escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)))

;(mov8caballo x y posn1x posn1y)

;matematicamente los movimientos del caballo son: (x,y)<-- posicion inicial
;los movimientos del caballo expresados por unidades a continuación
;tienen un valor en el codigo de 90 pixeles cuando, es decir: (x+90,y-180) para el primer caso
;movimiento 1 (x+1,y-2) 
;movimiento 2 (x+2,y-1)
;movimiento 3 (x+2,y+1)
;movimiento 4 (x+1,y+2)
;movimiento 5 (x-1,y+2)
;movimiento 6 (x-2,y+1)
;movimiento 7 (x-2,y-1)
;movimiento 8 (x-1,y-2)
;_______________________________________________________________________________<-separador

;conjunto de funciones que permiten verificar que el caballo no repita casillas
(define-struct posicion (x y))

(define vector-movimientos (make-vector 25))

(define (tposiciones vector-movimientos pos1 x y)
  (if (< pos1 (vector-length vector-movimientos))
      (if (<= y 470)
          (if (<= x 680)
              (begin
                (vector-set! vector-movimientos pos1 (make-posicion x y))
                (tposiciones vector-movimientos (+ pos1 1) (+ x 90) y))
              (tposiciones vector-movimientos pos1 320 (+ y 90)))
          (void))
      (void))
    )

(tposiciones vector-movimientos 0 320 110)

(vector-set! vector-movimientos posinicial (make-posicion 0 0))

(define (verificacion vector-movimientos pos1 x y)
  (if (< pos1 (vector-length vector-movimientos))
      (if (and (= (posicion-x (vector-ref vector-movimientos pos1)) x) (= (posicion-y (vector-ref vector-movimientos pos1)) y))
          (begin
            (vector-set! vector-movimientos pos1 (make-posicion 0 0))
            #f)
          (begin
            (verificacion vector-movimientos (+ pos1 1) x y)))
      (begin
        #t)))

(define (verificacion2 vector-movimientos pos1 x y)
  (if (< pos1 (vector-length vector-movimientos))
      (if (and (= (posicion-x (vector-ref vector-movimientos pos1)) x) (= (posicion-y (vector-ref vector-movimientos pos1)) y))
          (begin
            #f)
          (begin
            (verificacion2 vector-movimientos (+ pos1 1) x y)))
      (begin
        #t)))

;--Funcion de reinicio----------------
(define (reinicio)
  (begin
    ((draw-solid-rectangle ventana1) (make-posn 5 385) 275 200 "DarkGray")
    ((draw-string ventana1) (make-posn 20 400) "EL CABALLO SE HA QUEDADO" "black")
    ((draw-string ventana1) (make-posn 20 420) "SIN SALTOS EMPEZARA DE" "black")
    ((draw-string ventana1) (make-posn 20 440) "NUEVO EN BREVES MOMENTOS" "black")
    (sleep 5)
    (tablero 90 90 color)
    (caballo xinicio yinicio)
    (tposiciones vector-movimientos posinicial xinicio yinicio)
    (vector-set! vector-movimientos posinicial (make-posicion 0 0))
    (sleep 2)
    ((draw-solid-rectangle ventana1) (make-posn 5 385) 275 200 "DarkGray")
    (((draw-pixmap-posn "logo.png" 'unknown/mask) ventana1) (make-posn 100 400))
    (escoger-movimiento 3 x y posn1x posn1y posn2x posn2y)
))
;--------------------------------------------------------------------------------------------------
;funciones para saber si es posible reazlizar un movimiento
(define (mov1? x y posnx posny)
  (if (and (< (+ x 90) posnx) (> (- y 180) posny))
      #t
      #f))

(define (mov2? x y posnx posny)
  (if (and (< (+ x 180) posnx) (> (- y 90) posny))
      #t
      #f))

(define (mov3? x y posnx posny)
  (if (and (< (+ x 180) posnx) (< (+ y 90) posny))
      #t
      #f))

(define (mov4? x y posnx posny)
  (if (and (< (+ x 90) posnx) (< (+ y 180) posny))
      #t
      #f))

(define (mov5? x y posnx posny)
  (if (and (> (- x 90) posnx) (< (+ y 180) posny))
      #t
      #f))

(define (mov6? x y posnx posny)
  (if (and (> (- x 180) posnx) (< (+ y 90) posny))
      #t
      #f))

(define (mov7? x y posnx posny)
  (if (and (> (- x 180) posnx) (> (- y 90) posny))
      #t
      #f))

(define (mov8? x y posnx posny)
  (if (and (> (- x 90) posnx) (> (- y 180) posny))
      #t
      #f))
;-----------------------Función para verificar que no queden movimientos posibles----------------------


(define (movposibles p x y posn1x posn1y posn2x posn2y)
  (cond ((= p 1) (if (mov1? x y posn2x posn1y)
                     (if (verificacion2 vector-movimientos 0 (+ x 90) (- y 180))
                         (movposibles 2 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 2 x y posn1x posn1y posn2x posn2y)))
        ((= p 2) (if (mov2? x y posn2x posn1y)
                     (if (verificacion2 vector-movimientos 0 (+ x 180) (- y 90))
                         (movposibles 3 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 3 x y posn1x posn1y posn2x posn2y)))
        ((= p 3) (if (mov3? x y posn2x posn2y)
                     (if (verificacion2 vector-movimientos 0 (+ x 180) (+ y 90))
                         (movposibles 4 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 4 x y posn1x posn1y posn2x posn2y)))
        ((= p 4) (if (mov4? x y posn2x posn2y)
                     (if (verificacion2 vector-movimientos 0 (+ x 90) (+ y 180))
                         (movposibles 5 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 5 x y posn1x posn1y posn2x posn2y)))
        ((= p 5) (if (mov5? x y posn1x posn2y)
                     (if (verificacion2 vector-movimientos 0 (- x 90) (+ y 180))
                         (movposibles 6 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 6 x y posn1x posn1y posn2x posn2y)))
        ((= p 6) (if (mov6? x y posn1x posn2y)
                     (if (verificacion2 vector-movimientos 0 (- x 180) (+ y 90))
                         (movposibles 7 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 7 x y posn1x posn1y posn2x posn2y)))
        ((= p 7) (if (mov7? x y posn1x posn1y)
                     (if (verificacion2 vector-movimientos 0 (- x 180) (- y 90))
                         (movposibles 8 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 8 x y posn1x posn1y posn2x posn2y)))
        ((= p 8) (if (mov8? x y posn1x posn1y)
                     (if (verificacion2 vector-movimientos 0 (- x 90) (- y 180))
                         (movposibles 9 x y posn1x posn1y posn2x posn2y)
                         #t)
                     (movposibles 9 x y posn1x posn1y posn2x posn2y)))
        (else (reinicio))))

;--------------------------------------------------------------------------------------------------

;Base de la funcion del movimiento
;(define (escoger-movimiento n x y posn1x posn1y posn2x posn2y)
;  (cond ((= n 1) (mov1caballo x y posn2x posn1y))
;        ((= n 2) (mov2caballo x y posn2x posn1y))
;        ((= n 3) (mov3caballo x y posn2x posn2y))
;        ((= n 4) (mov4caballo x y posn2x posn2y))
;        ((= n 5) (mov5caballo x y posn1x posn2y))
;        ((= n 6) (mov6caballo x y posn1x posn2y))
;        ((= n 7) (mov7caballo x y posn1x posn1y))
;        ((= n 8) (mov8caballo x y posn1x posn1y))))

;funcion que escoge aleatoriamente una posicion para mover el caballo
(define (escoger-movimiento n x y posn1x posn1y posn2x posn2y)
  (cond ((= n 1) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov1? x y posn2x posn1y)
                         (if (verificacion vector-movimientos 0 (+ x 90) (- y 180))
                             (escoger-movimiento 2 x y posn1x posn1y posn2x posn2y)
                             (mov1caballo x y posn2x posn1y))
                         (escoger-movimiento 2 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 2 x y posn1x posn1y posn2x posn2y)))
        ((= n 2) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov2? x y posn2x posn1y)
                         (if (verificacion vector-movimientos 0 (+ x 180) (- y 90))
                             (escoger-movimiento 3 x y posn1x posn1y posn2x posn2y)
                             (mov2caballo x y posn2x posn1y))
                         (escoger-movimiento 3 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 3 x y posn1x posn1y posn2x posn2y)))
        ((= n 3) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov3? x y posn2x posn2y)
                         (if (verificacion vector-movimientos 0 (+ x 180) (+ y 90))
                             (escoger-movimiento 4 x y posn1x posn1y posn2x posn2y)
                             (mov3caballo x y posn2x posn2y))
                         (escoger-movimiento 4 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 4 x y posn1x posn1y posn2x posn2y)))
        ((= n 4) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov4? x y posn2x posn2y)
                         (if (verificacion vector-movimientos 0 (+ x 90) (+ y 180))
                             (escoger-movimiento 5 x y posn1x posn1y posn2x posn2y)
                             (mov4caballo x y posn2x posn2y))
                         (escoger-movimiento 5 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 5 x y posn1x posn1y posn2x posn2y)))
        ((= n 5) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov5? x y posn1x posn2y)
                         (if (verificacion vector-movimientos 0 (- x 90) (+ y 180))
                             (escoger-movimiento 6 x y posn1x posn1y posn2x posn2y)
                             (mov5caballo x y posn1x posn2y))
                         (escoger-movimiento 6 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 6 x y posn1x posn1y posn2x posn2y)))
        ((= n 6) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov6? x y posn1x posn2y)
                         (if (verificacion vector-movimientos 0 (- x 180) (+ y 90))
                             (escoger-movimiento 7 x y posn1x posn1y posn2x posn2y)
                             (mov6caballo x y posn1x posn2y))
                         (escoger-movimiento 7 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 7 x y posn1x posn1y posn2x posn2y)))
        ((= n 7) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov7? x y posn1x posn1y)
                         (if (verificacion vector-movimientos 0 (- x 180) (- y 90))
                             (escoger-movimiento 8 x y posn1x posn1y posn2x posn2y)
                             (mov7caballo x y posn1x posn1y))
                         (escoger-movimiento 8 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 8 x y posn1x posn1y posn2x posn2y)))
        ((= n 8) (if (movposibles 1 x y posn1x posn1y posn2x posn2y)
                     (if (mov8? x y posn1x posn1y)
                         (if (verificacion vector-movimientos 0 (- x 90) (- y 180))
                             (escoger-movimiento 1 x y posn1x posn1y posn2x posn2y)
                             (mov8caballo x y posn1x posn1y))
                         (escoger-movimiento 1 x y posn1x posn1y posn2x posn2y))
                     (escoger-movimiento 1 x y posn1x posn1y posn2x posn2y)))))
                     


(escoger-movimiento (+ (random 8) 1) x y posn1x posn1y posn2x posn2y)
;--------------------------------------------------------------------------------------
