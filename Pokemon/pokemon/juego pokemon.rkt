(require (lib "graphics.ss" "graphics"))
(open-graphics)

(require racket/set)
(require racket/dict)
(require racket/hash)
(require racket/vector)


(define SPRITE_HEIGHT 52)
(define SPRITE_WIDTH 34)
(define SPRITE_FEETS 20)

(define PROBABILIDAD_ATAQUE 10)

(define mapa-actual 5.1)

(define-struct obs (x y width height jumpable))
(define-struct grass (x y width height))
(define-struct entrada (x y width height mapa x2 y2))
(define-struct cuadro (x y ancho alto dialogo))
(define-struct jugador (nombre genero pokeball))
(define datos (make-jugador 0 0 0))


(define (fondooak ventana)
  (begin
    ((draw-viewport ventana) (make-rgb 0.6 0.850922 0.917))
    (((draw-pixmap-posn "profesor oak.png" 'unknown/mask ) ventana) (make-posn 175 0))
    (((draw-pixmap-posn "nueve1.png" 'unknown/mask ) ventana) (make-posn 0 300))
    ))

(define (escribir1 x lista)
  (begin
    ((draw-solid-rectangle ventana) (make-posn x 395)2 10 "black")
    (define a (key-value (get-key-press ventana)));tecla que oprim
    (define b (if (or (equal? a 'release) (not (char? a)))
                  "" (list->string (list (integer->char(char->integer a))))));vuelve la tecla en una cadena
    (if (equal? b "")
        (escribir1 x lista)  
        (begin   
          ((draw-solid-rectangle ventana) (make-posn x 395)5 10 "white");borra la barra para escribir
          ((draw-string ventana) (make-posn x 405) (if (equal? #\backspace  a)"" b) "black");escribe la tecla
          (if (equal? a (integer->char 13));si opimio enter, se detiene borra la barra de lo contrario la genera
              ((draw-solid-rectangle ventana) (make-posn (- x 3) 395)10 10 "white")
              ((draw-solid-rectangle ventana) (make-posn (+ x 10) 395)2 10 "black"))
          (if (not (equal? a (integer->char 13)));si opimio enter se detiene y entrega el nombre de lo contrario continua
              (if (equal? #\backspace  a)
                  (if (empty? lista)
                      (begin
                        ((draw-solid-rectangle ventana) (make-posn x 393)30 18  "white")
                        (escribir1 x (list)) )   
                      (begin
                        ((draw-solid-rectangle ventana) (make-posn (- x 10) 393)30 18  "white")
                        (escribir1 (- x 10) (reverse(cdr(reverse lista))))))
                  (escribir1 (+ x 10)(append lista (list a))))
              (list->string lista))))))

(define (genero x ventana)
  (if (= x 1)(((draw-pixmap-posn  "triangulo.png"  'unknown/mask ) ventana) (make-posn 50 373)))
  ((draw-string ventana) (make-posn 60 380) "Hombre             Mujer" "black")
  (define a (key-value (get-key-press ventana)))
  (cond
    ((equal? 'left a)
     (begin((draw-solid-rectangle ventana) (make-posn 150 370)8 13 "white")
           (((draw-pixmap-posn  "triangulo.png"  'unknown/mask ) ventana) (make-posn 50 373))
           (genero 1 ventana)))
    ((equal? 'right a)
     (begin((draw-solid-rectangle ventana) (make-posn 50 370)8 13 "white")
           (((draw-pixmap-posn  "triangulo.png"  'unknown/mask ) ventana) (make-posn 150 373))
           (genero 2 ventana)))
    ((equal? (integer->char 13) a)
     x)
    (else (genero x ventana))))

(define (dialogo-oak cont datosplayer ventana)
  (if (equal? (key-value (get-key-press ventana)) (integer->char 13))
      (begin ((draw-viewport ventana) "white")
             (if (>= 3 cont)
                 (begin
                   (if (= cont 1)(begin((draw-viewport ventana) "black")(sleep 3)))
                   (fondooak ventana)
                   (cond
                     ((= cont 1)
                      (begin
                        (sleep 1)((draw-string ventana) (make-posn 50 330) "¡Hola a todos! ¡Bienvenidos al mundo de POKÉMON! ¡Me llamo OAK!" "black")
                        (sleep 1) ((draw-string ventana) (make-posn 50 355) "¡Pero la gente me llama el PROFESOR POKÉMON! ¡Este mundo " "black")
                        (sleep 1) ((draw-string ventana) (make-posn 50 380) "está habitado por unas criaturas llamadas POKÉMON! Para algunos," "black")
                        (sleep 1) ((draw-string ventana) (make-posn 50 405) " los POKÉMON son mascotas. Pero otros los usan para pelear." "black")
                        (dialogo-oak (+ cont 1) datosplayer ventana)))
                     ((= cont 2)
                      (begin
                        (sleep 1) ((draw-string ventana) (make-posn 50 330) "En cuanto a mí... Estudio a los POKÉMON como profesión." "black")
                        (sleep 1) ((draw-string ventana) (make-posn 50 355) "dime, ¿cual es tu genero?:" "black")
                        (sleep 1) (set-jugador-genero! datosplayer (genero 1 ventana))
                        (sleep 1) ((draw-string ventana) (make-posn 50 405) "y tu nombre es?: " "black")
                        (sleep 1) (set-jugador-nombre! datosplayer (escribir1 160 (list)))
                        (dialogo-oak (+ cont 1) datosplayer ventana)))
                     ((= cont 3)
                      (begin
                        (sleep 1)((draw-string ventana) (make-posn 50 350) "¡Tu propia leyenda POKÉMON está a punto de comenzar!" "black")
                        (sleep 1)((draw-string ventana) (make-posn 50 370) "¡Te espera un mundo de sueños y aventuras con los POKÉMON!" "black")
                        (sleep 1)((draw-string ventana) (make-posn 50 390) "¡Adelante!" "black")
                        (dialogo-oak (+ cont 1) datosplayer ventana)))))(begin ((draw-viewport ventana) "black") (sleep 2))

                                                                        )) (dialogo-oak cont datosplayer ventana)) )


(define (escenario ventana)
  (begin
    ((draw-pixmap ventana) (dict-ref mapas mapa-actual) (make-posn 0 0) "blue")
    ))

(define mapas (hash 1 "mapa 1 a.jpg"
                    2 "mapa 2 a.jpg"
                    2.1 "mapa 2 b.jpg"
                    3 "mapa 3 a.jpg"
                    3.1 "mapa 3 b.jpg"
                    3.2 "mapa 3 c.jpg"
                    3.3 "mapa 3 d.jpg"
                    4 "mapa 4 a.jpg"
                    4.1 "mapa 4 b.jpg"
                    4.2 "mapa 4 c.jpg"
                    4.3 "mapa 4 d.jpg"
                    5 "casa1.1.png"
                    5.1 "casa1.2.png"
                    6 "casa2.png"
                    6.1 "casa2.png"
                    6.2 "casa2.png"
                    6.3 "casa2.png"
                    6.4 "casa2.png"
                    6.5 "casa2.png"
                    6.6 "casa2.png"
                    6.7 "casa2.png"
                    6.8 "casa2.png"
                    7 "enfermeria.png"
                    7.1 "enfermeria.png"
                    8 "tienda.png"
                    8.1 "tienda.png"
                    9 "laboratorio.png"
                    10 "gimnasio.png"
                    10.1 "gimnasio.png"
                   
                    ))

(define (entradas-mapa)
  (cond ((= mapa-actual 1) (set (make-entrada 0 0 600 10 2 -1 450)
                                (make-entrada 142 180 40 20 5 -1 450);casa1
                                (make-entrada 367 180 40 20 6 190 450);casa2
                                (make-entrada 392 330 40 20 9 280 450)));laboratorio
        ((= mapa-actual 2) (set (make-entrada 0 0 600 10 2.1 -1 450)
                                (make-entrada 0 495 600 5 1 -1 5)))
        ((= mapa-actual 2.1) (set (make-entrada 0 0 300 10 3 558 450)
                                  (make-entrada 300 0 315 10 3.2 10 450)
                                  (make-entrada 0 495 600 5 2 -1 5)))
        ((= mapa-actual 3) (set (make-entrada 0 0 600 10 3.1 -1 440)
                                (make-entrada 0 495 600 5 2.1 270 5)
                                (make-entrada 595 0 5 500 3.2 10 -1)))
        ((= mapa-actual 3.1) (set (make-entrada 190 495 600 5 3 -1 5)
                                  (make-entrada 595 0 5 500 3.3 10 -1)
                                  (make-entrada 0 0 5 500 4.3 558 30)))
        ((= mapa-actual 3.2) (set (make-entrada  290 0 50 10 8 200 440)
                                  (make-entrada  0 0 600 10 3.3 -1 450)
                                  (make-entrada  0 0 5 500 3 558 -1)
                                  (make-entrada 0 495 600 5 2.1 300 5)
                                  (make-entrada 40 155 50 25 7 270 450))) ;enfermeria
        ((= mapa-actual 3.3) (set (make-entrada 0 495 600 5 3.2 -1 5)
                                  (make-entrada 0 0 5 500 3.1 558 -1)
                                  (make-entrada  288 252 50 25 10 110 440);gimnasio
                                  (make-entrada  10 280 50 25 6.1 190 450);casa2
                                  (make-entrada  10 455 50 15 6.2 190 450);casa2
                                  (make-entrada  290 465 50 40 8 200 440)));tienda
        ((= mapa-actual 4) (set (make-entrada 0 495 600 5 4.2 -1 -3)
                                (make-entrada 595 0 5 500 4.1 10 -1)
                                (make-entrada 260 380 50 20 8.1 200 450))) ;tienda
        ((= mapa-actual 4.1) (set (make-entrada 0 495 600 5 4.3 -1 5)
                                  (make-entrada 0 0 5 500 4 550 -1)
                                  (make-entrada 0 125 50 25 6.3 190 450);casa2
                                  (make-entrada 90 405 50 25 6.4 190 450)));casa2
        ((= mapa-actual 4.2) (set (make-entrada 595 0 5 600 4.3 5 -1)
                                  (make-entrada 0 0 600 10 4 -1 450)
                                  (make-entrada  210 300 55 25 10.1 110 440);gimnasio
                                  (make-entrada 340 275 50 25 6.5 190 450);casa2
                                  (make-entrada 465 275 50 25 6.6 190 450)));casa2
        ((= mapa-actual 4.3) (set (make-entrada 0 0 600 10 4.1 -1 440)
                                  (make-entrada 595 0 5 500 3.1 10 440)
                                  (make-entrada  0 0 5 500 4.2 558 -1)
                                  (make-entrada  340 275 50 25 6.7 190 450);casa2
                                  (make-entrada  215 275 50 25 6.8 190 450);casa2
                                  (make-entrada  10 275 50 25 7.1 270 450)));enfermeria
        ((= mapa-actual 5) (set (make-entrada 130 495 80 30 1 142 170)
                                (make-entrada 490 105 20 80 5.1 500 110)))
        ((= mapa-actual 5.1) (set (make-entrada 480 100 20 90 5 460 100)))
        ((= mapa-actual 6) (set (make-entrada 170 495 85 30 1 367 160)))
        ((= mapa-actual 6.1) (set (make-entrada 170 495 85 30 3.3 30 290)))
        ((= mapa-actual 6.2) (set (make-entrada 170 495 85 30 3.3 30 430)))
        ((= mapa-actual 6.3) (set (make-entrada 170 495 85 30 4.1 25 130)))
        ((= mapa-actual 6.4) (set (make-entrada 170 495 85 30 4.1 105 410)))
        ((= mapa-actual 6.5) (set (make-entrada 170 495 85 30 4.2 360 280)))
        ((= mapa-actual 6.6) (set (make-entrada 170 495 85 30 4.2 480 280)))
        ((= mapa-actual 6.7) (set (make-entrada 170 495 85 30 4.3 365 280)))
        ((= mapa-actual 6.8) (set (make-entrada 170 495 85 30 4.3 220 280)))
        ((= mapa-actual 7) (set (make-entrada 235 495 86 5 3.2 50 155)))
        ((= mapa-actual 7.1) (set (make-entrada 235 495 86 5 4.3 35 275)))
        ((= mapa-actual 8) (set (make-entrada 165 495 100 5 3.2 300 -5)))
        ((= mapa-actual 8.1) (set (make-entrada 165 495 100 5 4 275 390)))
        ((= mapa-actual 9) (set (make-entrada 260 495 80 30 1 411 330)))
        ((= mapa-actual 10) (set (make-entrada 0 495 600 5 3.3 310 240)))
        ((= mapa-actual 10.1) (set (make-entrada  0 495 600 5 4.2 227 310)))

        (else (set))  ) )


(define (obstaculos-mapa)
  (cond ((= mapa-actual 1) (set (make-obs  0 0 298 42 #f)
                                (make-obs  352 0 300 42 #f)
                                (make-obs  125 100 124 80 #f)
                                (make-obs  352 100 124 80 #f)
                                (make-obs  325 250 174 80 #f)
                                (make-obs  125 288 124 10 #f)
                                (make-obs  325 414 150 10 #f)
                                (make-obs  174 424 100 80 #f)
                                (make-obs  0 40 40 460 #f)
                                (make-obs  560 40 40 460 #f)
                                (make-obs  50 490 500 10 #f)))

        ((= mapa-actual 2) (set (make-obs  0 405 298 200 #f)
                                (make-obs  352 405 300 200 #f)
                                (make-obs  0 115 298 50 #f)
                                (make-obs  0 0 40 460 #f)
                                (make-obs  560 0 40 460 #f)
                                ;saltar de arriba a bajo:
                                (make-obs  50 14 50 13 #t)
                                (make-obs  125 14 100 13 #t)
                                (make-obs  278 14 270 13 #t)
                                (make-obs  452 165 100 13 #t)
                                (make-obs  225 289 330 13 #t)
                                (make-obs  50 289 100 13 #t)))

        ((= mapa-actual 2.1) (set (make-obs  0 0 240 42 #f)
                                  (make-obs  352 0 250 42 #f)
                                  (make-obs  205 85 42 205 #f)
                                  (make-obs  55 360 42 55 #f)
                                  (make-obs  252 360 145 55 #f)
                                  (make-obs  0 40 40 460 #f)
                                  (make-obs  560 40 40 460 #f)
                                  ;saltar de arriba a bajo:
                                  (make-obs  50 138 150 13 #t)
                                  (make-obs  250 138 150 13 #t)
                                  (make-obs  50 264 150 13 #t)
                                  (make-obs  100 389 150 13 #t)))
  
        ((= mapa-actual 3) (set (make-obs  160 340 190 150 #f)
                                (make-obs  350 388 200 115 #f)
                                (make-obs  275 155 150 125 #f)
                                (make-obs  305 95 42 60 #f)
                                (make-obs  180 65 88 60 #f)
                                (make-obs  590 80 10 100 #f)
                                (make-obs  0 0 173 500 #f)
                                ;saltar de arriba a bajo:
                                (make-obs  170 265 105 13 #t)
                                (make-obs  425 265 75 13 #t)
                                (make-obs  575 265 28 13 #t)))

        ((= mapa-actual 3.1) (set (make-obs  0 0 200 390 #f)
                                  (make-obs  200 0 275 115 #f)
                                  (make-obs  225 155 250 270 #f)
                                  (make-obs  475 180 25 225 #f)
                                  (make-obs  575 225 25 80 #f)
                                  (make-obs  575 405 25 80 #f)))

        ((= mapa-actual 3.2) (set (make-obs  50 390 410 110 #f)
                                  (make-obs  0 75 125 80 #f)
                                  (make-obs  455 0 150 500 #f)
                                  ;saltar de arriba a bajo:
                                  (make-obs  0 265 450 13 #t)))

        ((= mapa-actual 3.3) (set (make-obs  250 410 100 60 #f)
                                  (make-obs  0 400 125 50 #f)
                                  (make-obs  0 225 125 50 #f)
                                  (make-obs  75 300 50 30 #f)
                                  (make-obs  225 155 148 100 #f)
                                  (make-obs  125 387 330 13 #f)
                                  (make-obs  455 0 145 500 #f)
                                  (make-obs  0 0 455 105 #f)
                                  (make-obs  0 455 5 45 #f)
                                  ;saltar de arriba a bajo:
                                  (make-obs  135 320 315 10 #t)
                                  ))


        ((= mapa-actual 4) (set (make-obs  125 175 350 105 #f)
                                (make-obs  225 320 100 60 #f)
                                (make-obs  325 340 195 15 #f)
                                (make-obs  525 180 50 25 #f)
                                (make-obs  200 445 225 70 #f)
                                (make-obs  0 435 190 20 #f)
                                (make-obs  170 435 20 100 #f)
                                (make-obs  0 0 600 125 #f)
                                (make-obs  0 124 48 315 #f)))

        ((= mapa-actual 4.1) (set (make-obs  175 175 325 105  #f)
                                  (make-obs  225 326 225 105 #f)
                                  (make-obs  50 328 150 80 #f)
                                  (make-obs  45 382 12 120 #f)
                                  (make-obs  150 470 50 5 #f)
                                  (make-obs  50 192 75 5 #f)
                                  (make-obs  0 266 150 10 #f)
                                  (make-obs  200 495 350 10 #f)
                                  (make-obs  562 0 58 500 #f)
                                  (make-obs  0 0 562 125 #f)))

        ((= mapa-actual 4.2) (set (make-obs  175 0 250 75 #f)
                                  (make-obs  425 60 165 15 #f)
                                  (make-obs  105 155 495 125 #f)
                                  (make-obs  120 290 30 30 #f)
                                  (make-obs  0 445 300 55 #f)
                                  (make-obs  305 385 165 120 #f)
                                  (make-obs  0 60 50 410 #f)
                                  ;saltar de arriba a bajo:
                                  (make-obs  100 388 125 13 #t)
                                  (make-obs  550 388 50 13 #t)
                                  (make-obs  100 260 13 142 #t)))

        ((= mapa-actual 4.3) (set (make-obs  130 405 465 95 #f)
                                  (make-obs  530 120 80 300 #f)
                                  (make-obs  0 155 120 125 #f)
                                  (make-obs  40 0 10 80 #f)
                                  (make-obs  175 85 300 15 #f)
                                  (make-obs  275 100 180 55 #f)
                                  (make-obs  175 95 10 155 #f)
                                  (make-obs  465 95 10 155 #f)
                                  (make-obs  180 220 280 60 #f)
                                  (make-obs  175 335 125 10 #f)
                                  (make-obs  375 335 100 10 #f)
                                  (make-obs  200 0 400 10 #f)
                                  ;saltar de arriba a bajo:
                                  (make-obs  0 388 125 13 #t)
                                  (make-obs  112 250 13 150 #t)))

        ((= mapa-actual 5) (set (make-obs  0 0 600 100 #f)
                                (make-obs  0 100 190 40 #f)
                                (make-obs  245 100 55 40 #f)
                                (make-obs  505 180 100 10 #f)
                                (make-obs  250 220 100 100 #f)
                                (make-obs  360 220 30 60 #f);mom
                                (make-obs  0 350 45 85 #f)
                                (make-obs  555 350 45 85 #f)))
        ((= mapa-actual 5.1) (set (make-obs  0 0 600 100 #f)
                                  (make-obs  0 100 275 20 #f)
                                  (make-obs  270 215 60 145 #f)
                                  (make-obs  375 100 25 100 #f)
                                  (make-obs  375 185 115 30 #f)))
        ((vector-member mapa-actual (vector 6 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8))
         (set (make-obs  0 0 600 140 #f);casa2
              (make-obs  20 140 280 40 #f)
              (make-obs  240 270 110 110 #f)
              (make-obs  0 270 15 250 #f)
              (make-obs  565 215 35 300 #f)
              (make-obs  425 140 45 120 #f)
              (make-obs  485 140 50 80 #f)
              (make-obs  350 260 30 40 #f);niñ02
              (make-obs  250 220 30 40 #f)));niñ01

        ((vector-member mapa-actual (vector 7 7.1)) (set (make-obs  0 0 535 140 #f)
                                                         (make-obs  85 140 400 65 #f)
                                                         (make-obs  480 340 100 100 #f)));enfermeria

        ((vector-member mapa-actual (vector 8 8.1)) (set (make-obs  0 0 600 110 #f)
                                                         (make-obs  0 0 140 320 #f)
                                                         (make-obs  325 255 110 200 #f)
                                                         (make-obs  545 0 55 450 #f)));tienda
        ((= mapa-actual 9) (set (make-obs 0 0 600 80 #f)
                                (make-obs  0 130 140 106 #f)
                                (make-obs  0 290 235 80 #f)
                                (make-obs  365 290 235 80 #f)
                                (make-obs  365 160 145 50 #f)
                                (make-obs  273 160 40 45 #f)
                                (make-obs  0 440 40 60 #f)
                                (make-obs  560 440 40 60 #f)))

        ((vector-member mapa-actual (vector 10 10.1)) (set (make-obs 0 0 600 80 #f)
                                                           (make-obs  0 0 600 175 #f)
                                                           (make-obs  0 175 105 500 #f)
                                                           (make-obs  490 175 105 500 #f)
                                                           (make-obs  105 175 128 50 #f)
                                                           (make-obs  233 325 128 50 #f)
                                                           (make-obs  105 275 128 100 #f)
                                                           (make-obs  362 175 130 50 #f)
                                                           (make-obs  362 425 128 100 #f)
                                                           (make-obs  148 425 170 100 #f)
                                                           (make-obs  278 162 40 55 #f)))))


(define (hierbas-mapa)
  (cond ((= mapa-actual 2) (set
                            (make-grass  300 102 150 125)
                            (make-grass  100 302 175 50)
                            (make-grass  50 352 175 50)
                            (make-grass  300 378 50 120)
                            (make-grass  425 302 125 50)
                            (make-grass  375 352 125 50)))
        ((= mapa-actual 2.1) (set
                              (make-grass  250 152 300 125)
                              (make-grass  400 325 150 125)))
        (else (set))))

(define ventana (open-viewport "pokemon" 600 500))
;limites:



(define (sprite x y genero a ventana)
  (((draw-pixmap-posn (cond
                        ((= genero 2) (cond
                                        ((= a 1) "mujer iz.png")
                                        ((= a 2) "mujer de.png")
                                        ((= a 3) "mujer ar.png")
                                        ((= a 4) "mujer ab.png")
                                        ))
                        (else         (cond
                                        ((= a 1) "hombre iz.png")
                                        ((= a 2) "hombre de.png")
                                        ((= a 3) "hombre ar.png")
                                        ((= a 4) "hombre ab.png"))))  'unknown/mask ) ventana) (make-posn x y)))

(define (muñeco x y flecha genero ventana)
  (cond
    ((equal? flecha 'izquierda)(begin (escenario ventana)(sprite x y genero 1 ventana)))
    ((equal? flecha 'derecha)  (begin (escenario ventana)(sprite x y genero 2 ventana)))
    ((equal? flecha 'arriba)   (begin (escenario ventana)(sprite x y genero 3 ventana)))
    ((equal? flecha 'abajo)    (begin (escenario ventana)(sprite x y genero 4 ventana)))
    ))

;movimiento
(define (movimiento x y tecla genero ventana)
  (begin (dialogo? x y tecla ventana genero)
         (cond
           ((equal? tecla 'up)   (movimiento-arriba x y genero ventana))
           ((equal? tecla 'down) (movimiento-abajo x y genero ventana))
           ((equal? tecla 'left) (movimiento-izquierda x y genero ventana))
           ((equal? tecla 'right) (movimiento-derecha x y genero ventana))
           (else (movimiento x y (key-value (get-key-press ventana))genero ventana)))));si alguna tecla hace alguna accion usar este ringlon

(define (movimiento-arriba x y genero ventana)
  (if (puedo-mover? x (- y 10) 'arriba) (moverse x (- y 10) 'arriba genero ventana) (moverse x y 'arriba genero ventana)))
(define (movimiento-abajo x y genero ventana)
  (if (puedo-mover? x (+ y 10) 'abajo) (moverse x (+ y 10) 'abajo genero ventana) (moverse x y 'abajo genero ventana)))
(define (movimiento-izquierda x y genero ventana)
  (if (puedo-mover? (- x 10) y 'izquierda) (moverse (- x 10) y 'izquierda genero ventana) (moverse x y 'izquierda genero ventana)))
(define (movimiento-derecha x y genero ventana)
  (if (puedo-mover? (+ x 10) y 'derecha) (moverse (+ x 10) y 'derecha genero ventana) (moverse x y 'derecha genero ventana)))


(define (puedo-mover? x y tecla)
  (and (and (and (>= x -20) (< (+ x SPRITE_WIDTH) 620)) (and (>= (+ y (- SPRITE_HEIGHT SPRITE_FEETS)) 0) (< y 500))) (not (hay-obstaculo? x y tecla)))
  )

(define (hay-obstaculo? x y tecla)
  (begin
    (define coincidencias (for/set ([i (obstaculos-mapa)]
                                    #:when (and (not (and (equal? tecla 'abajo) (obs-jumpable i))) (and (and (>= (+ x SPRITE_WIDTH) (obs-x i)) (<= x (+ (obs-x i) (obs-width i))))
                                                                                                        (and (>= (+ y SPRITE_HEIGHT) (obs-y i)) (<= (+ y (- SPRITE_HEIGHT SPRITE_FEETS)) (+ (obs-y i) (obs-height i)))))))
                            i))
    (> (set-count coincidencias) 0) ))

(define (moverse x y tecla genero ventana)
  (begin
    (muñeco x y tecla genero ventana)
    (revisar-ataque x y ventana)
    (define pos (revisar-cambiomapa x y ventana))
    (movimiento (posn-x pos) (posn-y pos) (key-value (get-key-press ventana))genero ventana)))

(define (revisar-ataque x y ventana)
  (if (and (sobre-hierba? x y) (recibir-ataque?))
      (iniciar-batalla ventana (random 11)) ) )

(define (sobre-hierba? x y)
  (begin
    (define coincidencias (for/set ([i (hierbas-mapa)]
                                    #:when (and (and (> (+ x SPRITE_WIDTH) (grass-x i)) (< x (+ (grass-x i) (grass-width i))))
                                                (and (> (+ y SPRITE_HEIGHT) (grass-y i)) (< (+ y (- SPRITE_HEIGHT SPRITE_FEETS)) (+ (grass-y i) (grass-height i))))))
                            i))
    (> (set-count coincidencias) 0) ))

(define (recibir-ataque?)
  (> (random 100) (- 100 PROBABILIDAD_ATAQUE)) )

(define (revisar-cambiomapa x y ventana)
  (begin
    (define x2 x)
    (define y2 y)
    (define coincidencias (for/set ([i (entradas-mapa)]
                                    #:when (and (and (> (+ x SPRITE_WIDTH) (entrada-x i)) (< x (+ (entrada-x i) (entrada-width i))))
                                                (and (> (+ y SPRITE_HEIGHT) (entrada-y i)) (< (+ y (- SPRITE_HEIGHT SPRITE_FEETS)) (+ (entrada-y i) (entrada-height i))))))
                            i))

    (if (> (set-count coincidencias) 0)
        (begin
          (set! mapa-actual (entrada-mapa (set-first coincidencias)))        
          (if (not (= (entrada-x2 (set-first coincidencias)) -1))
              (set! x2 (entrada-x2 (set-first coincidencias))))
          (if (not (= (entrada-y2 (set-first coincidencias)) -1))
              (set! y2 (entrada-y2 (set-first coincidencias))))
          ))(make-posn x2 y2)))



(define-struct pokemon (tipo nivel vida))

(define mis-pokemones (hash))

(set! mis-pokemones (dict-set mis-pokemones 1 (make-pokemon "pikachu" 5 115)))

(define (iniciar-batalla ventana nivel)
  ((draw-viewport ventana) "black") (sleep 0.5)
  ((draw-pixmap ventana) "BatallaHierba.png"(make-posn 0 0) "blue")
  (define aleatorio (dict-ref pokemones (random 8)))
  (((draw-pixmap-posn (imagpok aleatorio) 'unknown/mask) ventana) (make-posn 400 150))
  (((draw-pixmap-posn (imagpokprop (pokemon-tipo (dict-ref mis-pokemones 1))) 'unknown/mask) ventana) (make-posn 100 270))
  ((draw-string ventana) (make-posn 50 80) aleatorio)
  ((draw-string ventana) (make-posn 230 80) (number->string nivel))
  ((draw-string ventana) (make-posn 400 290) (pokemon-tipo (dict-ref mis-pokemones 1)))
  ((draw-string ventana) (make-posn 570 290) (number->string (pokemon-nivel (dict-ref mis-pokemones 1))))
  (batalla ventana (+ (random 21) 10) (+ (random 21) 10))
  )

(define (batalla ventana a b)
  (if (< a 115)
      (if (< b 115)
          (begin
            (if (equal? (key-value (get-key-press ventana)) (integer->char 13))
                (begin 
                  ((draw-solid-rectangle ventana) (make-posn 120 98) a 9 "gray")
                  (sleep 1)
                  ((draw-solid-rectangle ventana) (make-posn 470 307) b 9 "gray")
                  (set-pokemon-vida! (dict-ref mis-pokemones 1) (- (pokemon-vida (dict-ref mis-pokemones 1)) b))
                  (batalla ventana (+ a (+ (random 21) 10)) (+ b (+ (random 21) 10)))
                  ) (batalla ventana a b)))
          ((draw-solid-rectangle ventana) (make-posn 470 307) 115 9 "gray"))
      ((draw-solid-rectangle ventana) (make-posn 120 98) 115 9 "gray")))

(define pokemones (hash
                   0 "pikachu"
                   1 "bulbasur" 
                   2 "abra" 
                   3 "clefairy" 
                   4 "diglett"
                   5 "charmander" 
                   6 "sandshrew" 
                   7 "nidoran"
                   8  "squirtle"))


(define (imagpok x)
  (cond          ((equal? "pikachu" x) "pokemones/pikachu.png")
                 ((equal? "bulbasur" x) "pokemones/bulbasur.png")
                 ((equal? "abra" x) "pokemones/abra.png")
                 ((equal? "clefairy" x) "pokemones/clefairy.png")
                 ((equal? "diglett" x) "pokemones/diglett.png")
                 ((equal? "charmander" x) "pokemones/charmander.png")
                 ((equal? "sandshrew" x)  "pokemones/sandshrew.png")
                 ((equal? "nidoran" x) "pokemones/nidoran.png")
                 ((equal? "squirtle" x) "pokemones/squirtle.png")))

(define (imagpokprop x)
  (cond          ((equal? "pikachu" x) "pokemonprop/16.png")
                 ((equal? "bulbasur" x) "pokemonprop/11.png")
                 ((equal? "abra" x) "pokemonprop/10.png")
                 ((equal? "clefairy" x) "pokemonprop/13.png")
                 ((equal? "diglett" x) "pokemonprop/14.png")
                 ((equal? "charmander" x) "pokemonprop/12.png")
                 ((equal? "sandshrew" x)  "pokemonprop/17.png")
                 ((equal? "nidoran" x) "pokemonprop/15.png")
                 ((equal? "squirtle" x) "pokemones/18.png")))




(define (dialogos x)
  (begin
    (((draw-pixmap-posn  "nueve2.png"  'unknown/mask ) ventana) (make-posn 0 373))
    (cond
      ((= x -1) ((draw-string ventana) (make-posn 30 420) "Nuestro vecino, el PROF. OAK, quería verte antes de que emprendas tu viaje." "black"))
      ((= x -2) (begin
                  ((draw-string ventana) (make-posn 50 410) "hola, espero te encuentres muy bien " "black")
                  ((draw-string ventana) (make-posn 270 410) "ruben"  "black")
                  (sleep 1)((draw-string ventana) (make-posn 50 430) "para empezar tu viaje debes tener un POKEMON ¿cual de estos quieres?" "black")))
      ((= x -3)((draw-string ventana) (make-posn 50 410) "hola, si quieres curar a tus POKEMON este es el lugar indicado" "black"))
      ((= x -4)((draw-string ventana) (make-posn 50 410) "bienvenido a la tienda POKEMON, aqui puedes comprar POKEBALLS" "black"))
      ((= x -5)((draw-string ventana) (make-posn 50 410) "bienvenido a mi gimnasio,espero estes listo para una batalla" "black"))
      ((= x 1)(begin
                ((draw-string ventana) (make-posn 30 410) "¡Hola!, ya que estas por aquí, te recomiendo que si tienes POKEMON heridos ve a " "black")
                (sleep 1)((draw-string ventana) (make-posn 30 430) "la enfermería a curarlos." "black")))
      ((= x 2)((draw-string ventana) (make-posn 30 410) "¡Oye tú! si no tienes POKEBALLS, puedes comprarlas en la tienda""black"))
      ((= x 3)(begin
                ((draw-string ventana) (make-posn 30 410) "¡Hey!, si quieres POKEMON, captúralos en la hierba,""black")
                (sleep 1)((draw-string ventana) (make-posn 30 430) "pero cuidado, los tuyos pueden salir heridos.""black")))
      ((= x 4)(begin
                ((draw-string ventana) (make-posn 30 410)"Si quieres dinero, enfréntate a líderes de gimnasio POKEMON o a POKEMON y gánales,""black")
                (sleep 1)((draw-string ventana) (make-posn 30 430)"pero si pierdes, también pierdes dinero.""black")))    
      ((= x 5)(begin
                ((draw-string ventana) (make-posn 30 410)"¿Te digo un secreto? Los líderes de gimnasio POKEMON dan más dinero,""black")
                ((draw-string ventana) (make-posn 30 430)"pero no le digas a nadie.""black")))
      ((= x 6)((draw-string ventana) (make-posn 30 410)"Los § sirven para comprar POKEBALLS en la tienda, ¡consíguelos y gástalos!""black"))
      (else((draw-string ventana) (make-posn 30 410)"¿Si te digo que hay un huevo de pascua en el juego, como te quedas? Wowowowowo.""black"))
      )))


(define (hablar)
  (cond
    ((vector-member mapa-actual (vector 5))(set (make-cuadro 310 160 130 155 -1)))
    ((vector-member mapa-actual (vector 6 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 ))
     (set (make-cuadro 320 220 110 150 (+ 1 (random 6)))
          (make-cuadro 180 180 150 150 (+ 1 (random 6)))))
    ((vector-member mapa-actual (vector 7 7.1))(set (make-cuadro 85 200 400 40 -3)))
    ((vector-member mapa-actual (vector 8 8.1))(set (make-cuadro 100 100 70 200 -4)))
    ((= mapa-actual 9) (set (make-cuadro 223 90 140 160 -2)))
    ((vector-member mapa-actual (vector 10 10.1))(set (make-cuadro 223 90 140 160 -5)))
    (else (set)) ))



(define (dialogo? x y tecla ventana genero)
  (begin
    (define coincidencias (for/set ([i (hablar)]
                                    #:when (and (and (> (+ x SPRITE_WIDTH) (cuadro-x i)) (< x (+ (cuadro-x i) (cuadro-ancho i))))
                                                (and (> (+ y SPRITE_HEIGHT) (cuadro-y i)) (< (+ y (- SPRITE_HEIGHT SPRITE_FEETS)) (+ (cuadro-y i) (cuadro-alto i))))))
                            i))
    (if (and (> (set-count coincidencias) 0) (equal? tecla (integer->char 13)))
        
        (begin (dialogos (cuadro-dialogo (set-first coincidencias)) )
               (if (equal? (key-value (get-key-press ventana)) (integer->char 13))
                   (movimiento x y 'up genero ventana))) ))) 



;(dict-ref mis-pokemones 2)


(define (player)
  (begin
    (make-jugador
     1
     1;hombre o mujer
     0
     )))


((draw-viewport ventana) "black")
(((draw-pixmap-posn "marca_UTP.png" 'unknown/mask ) ventana) (make-posn 175 175))(sleep 4)
(play-sound "musica inicio.mp3" #t)
((draw-pixmap ventana) "portada inicio.jpg" (make-posn 0 0) "blue")
(dialogo-oak 1 datos ventana)
(movimiento 90 190 'up (jugador-genero datos) ventana)





