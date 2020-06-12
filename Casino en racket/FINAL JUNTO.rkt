(require(lib"graphics.ss""graphics"))
(open-graphics)

(define-struct tienda (char1 char2 char3 char4))
(define HUD (make-vector 3))
(vector-set! HUD 0 (tienda 0 0 0 0))
(vector-set! HUD 1 0)
(vector-set! HUD 2 50)

(define (principal)
(define (Pantallaprincipal)
  (define win1 (open-viewport "CASINO BIT" 1350 700))
  (((draw-pixmap-posn "principal.jpg" 'unknown/mask ) win1) (make-posn 0 0))
  (validar win1)
  )
(define (validar win1)
  (define h (get-mouse-click win1))
  (if (and (and (<= (posn-x (mouse-click-posn h)) 850) (<= (posn-y (mouse-click-posn h)) 540)) (and (>= (posn-x (mouse-click-posn h)) 550) (>= (posn-y (mouse-click-posn h)) 400)))
      (begin
        (close-viewport win1)
        (Movimientos)
        )
      (validar win1)
      )
  )
(Pantallaprincipal))
;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;
(define (Movimientos)
  
(define win1 (open-viewport "LOBBY" 1350 700))
((draw-pixmap win1)"pantallacaminante.bmp"(make-posn 0 0)"violet")
  (define (pantalla)
    ((draw-pixmap win1)"pantallacaminante.bmp"(make-posn 0 0)"violet")
    (ver)
    )
  (define (uno)
    (((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1000 183 ))
    (((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183 ))
    (if (< (vector-ref HUD 2)0)
        (begin (vector-set! HUD 2 0)(uno))
      (if (= (vector-ref HUD 2)0)(((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)1)(((draw-pixmap-posn "1mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)2)(((draw-pixmap-posn "2mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)3)(((draw-pixmap-posn "3mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)4)(((draw-pixmap-posn "4mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)5)(((draw-pixmap-posn "5mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)6)(((draw-pixmap-posn "6mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)7)(((draw-pixmap-posn "7mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)8)(((draw-pixmap-posn "8mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
      (if (= (vector-ref HUD 2)9)(((draw-pixmap-posn "9mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
          ))))))))))))
  (define (dos2 x)
    (if (< x 10)
        (dos x)
        (dos2 (- x 10))))
  (define (dos x)
    (((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1000 183 ))
    (if (= (floor(/ (vector-ref HUD 2)10))1)(((draw-pixmap-posn "1mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))2)(((draw-pixmap-posn "2mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))3)(((draw-pixmap-posn "3mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))4)(((draw-pixmap-posn "4mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))5)(((draw-pixmap-posn "5mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))6)(((draw-pixmap-posn "6mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))7)(((draw-pixmap-posn "7mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))8)(((draw-pixmap-posn "8mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
    (if (= (floor(/ (vector-ref HUD 2)10))9)(((draw-pixmap-posn "9mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
        )))))))))
    (if (= x 0)(((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 1)(((draw-pixmap-posn "1mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 2)(((draw-pixmap-posn "2mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 3)(((draw-pixmap-posn "3mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 4)(((draw-pixmap-posn "4mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 5)(((draw-pixmap-posn "5mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 6)(((draw-pixmap-posn "6mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 7)(((draw-pixmap-posn "7mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 8)(((draw-pixmap-posn "8mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 9)(((draw-pixmap-posn "9mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
        )))))))))))
   (define (tres3 x y)
     (if (< y 100)
         (if (< x 10)
             (tres x y)
             (tres3 (- x 10)y)
             )
         (tres3 x (- y 100))
         ))
    (define (tres x y)
      (if (= (floor(/ (vector-ref HUD 2)100))1)(((draw-pixmap-posn "1mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))2)(((draw-pixmap-posn "2mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))3)(((draw-pixmap-posn "3mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))4)(((draw-pixmap-posn "4mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))5)(((draw-pixmap-posn "5mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))6)(((draw-pixmap-posn "6mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))7)(((draw-pixmap-posn "7mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))8)(((draw-pixmap-posn "8mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
      (if (= (floor(/ (vector-ref HUD 2)100))9)(((draw-pixmap-posn "9mini.jpg" 'unknown/mask ) win1)(make-posn 1000 183))
          )))))))))
      (if (= (floor (/ y 10))0)(((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))1)(((draw-pixmap-posn "1mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))2)(((draw-pixmap-posn "2mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))3)(((draw-pixmap-posn "3mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))4)(((draw-pixmap-posn "4mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))5)(((draw-pixmap-posn "5mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))6)(((draw-pixmap-posn "6mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))7)(((draw-pixmap-posn "7mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))8)(((draw-pixmap-posn "8mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
      (if (= (floor (/ y 10))9)(((draw-pixmap-posn "9mini.jpg" 'unknown/mask ) win1) (make-posn 1050 183))
          ))))))))))
    (if (= x 0)(((draw-pixmap-posn "0mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 1)(((draw-pixmap-posn "1mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 2)(((draw-pixmap-posn "2mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 3)(((draw-pixmap-posn "3mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 4)(((draw-pixmap-posn "4mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 5)(((draw-pixmap-posn "5mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 6)(((draw-pixmap-posn "6mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 7)(((draw-pixmap-posn "7mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 8)(((draw-pixmap-posn "8mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
    (if (= x 9)(((draw-pixmap-posn "9mini.jpg" 'unknown/mask ) win1) (make-posn 1100 183 ))
        )))))))))))
  (define (ver)
    (if (and (> (vector-ref HUD 2)9)(< (vector-ref HUD 2)99))
      (dos2 (vector-ref HUD 2))
    (if (and (> (vector-ref HUD 2)99)(< (vector-ref HUD 2)999))
      (tres3 (vector-ref HUD 2)(vector-ref HUD 2))
      (uno)
    )))      
  (define (cuadrode x y)
    (if (= (vector-ref HUD 1)0)(begin
        (pantalla)
        (((draw-pixmap-posn "TomDerecha1.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom (+ 20 x) y (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)1)(begin
        (pantalla)
        (((draw-pixmap-posn "SamDerecho1.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom (+ 20 x) y (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)2)(begin
        (pantalla)
        (((draw-pixmap-posn "CamareroDerecho1.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom (+ 20 x) y (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)3)(begin
        (pantalla)
        (((draw-pixmap-posn "ProfesorDerecho1.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom (+ 20 x) y (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)4)(begin
        (pantalla)
        (((draw-pixmap-posn "LinkDerecha1.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom (+ 20 x) y (key-value (get-key-press win1))))
        ))))))
     
    (define (cuadroiz x y)
      (if (= (vector-ref HUD 1)0)(begin
          (pantalla)
          (((draw-pixmap-posn "TomIzquierda1.png" 'unknown/mask ) win1) (make-posn x y))
          (movimientoTom (- x 20) y (key-value (get-key-press win1))))
      (if (= (vector-ref HUD 1)1)(begin
          (pantalla)
          (((draw-pixmap-posn "SamIzquierdo1.png" 'unknown/mask ) win1) (make-posn x y))
          (movimientoTom (- x 20) y (key-value (get-key-press win1))))
      (if (= (vector-ref HUD 1)2)(begin
          (pantalla)
          (((draw-pixmap-posn "CamareroIzquierdo1.png" 'unknown/mask ) win1) (make-posn x y))
          (movimientoTom (- x 20) y (key-value (get-key-press win1))))
      (if (= (vector-ref HUD 1)3)(begin
          (pantalla)
          (((draw-pixmap-posn "ProfesorIzquierdo1.png" 'unknown/mask ) win1) (make-posn x y))
          (movimientoTom (- x 20) y (key-value (get-key-press win1))))
      (if (= (vector-ref HUD 1)4)(begin
          (pantalla)
          (((draw-pixmap-posn "LinkIzquierda1.png" 'unknown/mask ) win1) (make-posn x y))
          (movimientoTom (- x 20) y (key-value (get-key-press win1))))
          ))))))
  
  (define (cuadroup x y)
    (if (= (vector-ref HUD 1)0)(begin
        (pantalla)
        (((draw-pixmap-posn "TomArriba.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (- y 20) (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)1)(begin
        (pantalla)
        (((draw-pixmap-posn "SamArriba.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (- y 20) (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)2)(begin
        (pantalla)
        (((draw-pixmap-posn "CamareroArriba.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (- y 20) (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)3)(begin
        (pantalla)
        (((draw-pixmap-posn "ProfesorArriba.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (- y 20) (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)4)(begin
        (pantalla)
        (((draw-pixmap-posn "LinkArriba.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (- y 20) (key-value (get-key-press win1))))
        ))))))

  (define (cuadrodown x y)
    (if (= (vector-ref HUD 1)0)(begin
        (pantalla)
        (((draw-pixmap-posn "TomDerecha.png" 'unknown/mask ) win1) (make-posn x y))
        (pantalla)
        (((draw-pixmap-posn "TomIzquierda.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (+ 20 y) (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)1)(begin
        (pantalla)
        (((draw-pixmap-posn "SamDerecho.png" 'unknown/mask ) win1) (make-posn x y))
        (pantalla)
        (((draw-pixmap-posn "SamIzquierdo.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (+ 20 y) (key-value (get-key-press win1))))
     (if (= (vector-ref HUD 1)2)(begin
        (pantalla)
        (((draw-pixmap-posn "CamareroDerecho.png" 'unknown/mask ) win1) (make-posn x y))
        (pantalla)
        (((draw-pixmap-posn "CamareroIzquierdo.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (+ 20 y) (key-value (get-key-press win1))))
    (if (= (vector-ref HUD 1)3)(begin
        (pantalla)
        (((draw-pixmap-posn "ProfesorDerecho.png" 'unknown/mask ) win1) (make-posn x y))
        (pantalla)
        (((draw-pixmap-posn "ProfesorIzquierdo.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (+ 20 y) (key-value (get-key-press win1))))
     (if (= (vector-ref HUD 1)4)(begin
        (pantalla)
        (((draw-pixmap-posn "LinkDerecha.png" 'unknown/mask ) win1) (make-posn x y))
        (pantalla)
        (((draw-pixmap-posn "LinkIzquierda.png" 'unknown/mask ) win1) (make-posn x y))
        (movimientoTom x (+ 20 y) (key-value (get-key-press win1))))
         ))))))
  (define (movimientoTom x1 y1 key)
    (if (and (and (> x1 0)(<= x1 400))(>= y1 535)(< y1 700))
        (beign (close-viewport win1)(Jackpot))
    (if (and (and (> x1 180)(<= x1 1160))(>= y1 500)(< y1 670))
        (begin (close-viewport win1)(Jackpot))
    (if (and (and (> x1 0)(<= x1 270))(>= y1 270)(< y1 435))
        (begin (close-viewport win1)(Jackpot))
    (if (and (and (> x1 300)(<= x1 545))(>= y1 70)(< y1 370))
        (begin (close-viewport win1)(LuckyWheel))
    (if (and (and (> x1 600)(<= x1 1350))(>= y1 10)(< y1 110))
        (begin (close-viewport win1)(tiendaPersonajes))
                        (if (equal? key 'up)
                            (begin
                              (cuadroup x1 y1)
                              (movimientoTom x1 (- y1 10)  (key-value (get-key-press win1))))
                            (if (equal? key 'down)
                                (begin
                                  (cuadrodown x1 y1)
                                  (movimientoTom x1 (+ 10 y1)  (key-value (get-key-press win1))) )
                                (if (equal? key 'right)
                                    (begin
                                      (cuadrode x1 y1)
                                      (movimientoTom (+ x1 10) y1  (key-value (get-key-press win1))) )
                                    (if (equal? key 'left)
                                        (begin
                                          (cuadroiz x1 y1)
                                          (movimientoTom (- x1 10) y1  (key-value (get-key-press win1))) )
                                        (movimientoTom x1 y1  (key-value (get-key-press win1)))
                    ))))))))))
  (movimientoTom 600 200 (key-value (get-key-press win1)))
  )
;----------------------------------------------------------------------------------------------------------------------------;;
(define (LuckyWheel)
  (define win1 (open-viewport "LUCKYWHEEL" 1350 700))
  (((draw-pixmap-posn "luckywheel.jpg" 'unknown/mask ) win1) (make-posn 0 0))
(define (maquina2 i b)   ;;;;;;;Juego de premios;;;;;;;;
  (if (>= (vector-ref HUD 2)5) ;;;;;;Verificacion del dinero;;;;;;
      (if (= b 5)
          (intentar (+ 5 i)0);;;;Premio 5;;;;;
          (if (= b 10)
              (intentar (+ 10 i)0);;;;Premio 10;;;;;
              (if (= b 25)
                  (intentar (+ 25 i)0);;;;Premio 25;;;;;
                  (if (= b 50)
                      (intentar (+ 50 i)0);;;;Premio 50;;;;;
                      )
                  )
              )
          )
      (display "No tiene dinero");;;;;;Aqui podria aparecer una ventana donde dice que no tiene dinero y cuando no tenga dinero se acaba el juego;;;;;;;;
      )
  )

(define (contadoranimacion2 i i1 i2 b) ;;;;;Animacion de la ruleta;;;;;;
  (if (< i1 i2)
      (begin
      (((draw-pixmap-posn "1.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "2.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "3.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "4.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "5.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "6.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "7.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "8.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (contadoranimacion2 i (+ 1 i1)i2 b)
      )
      (if (= b 1)  ;;;;;Ultima imagen que dice el premio;;;;;
          (begin (((draw-pixmap-posn "1.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
          (if (= b 2)
              (begin (((draw-pixmap-posn "2.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "50mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 50))
              (if (= b 3)
                  (begin (((draw-pixmap-posn "3.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
                  (if (= b 4)
                      (begin (((draw-pixmap-posn "4.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "10mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 10))
                      (if (= b 5)
                          (begin (((draw-pixmap-posn "5.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
                          (if (= b 6)
                              (begin (((draw-pixmap-posn "6.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "25mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 25))
                              (if (= b 7)
                                  (begin (((draw-pixmap-posn "7.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
                                  (if (= b 8)
                                      (begin (((draw-pixmap-posn "8.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "10mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 10))
                                      )
                                  )
                              )
                          )
                      )
                  )
              )
          )
      )
  )

(define (intentar i b) ;;;;;Volver a intentar;;;;; ;;;;;;;;;;;;;;AQUI;;;;;;;;;;;
  (if (= b 1)
      (begin
        (vector-set! HUD 2 (- i 10)) ;;;;Descuenta 10 para jugar;;;;;
        (contadoranimacion2 (vector-ref HUD 2) (- i 10)(+ 10 (random 10)) (+ 1 (random 8)))
        )
      (begin
        (vector-set! HUD 2 i) ;;;;OTRA VENTANA DONDE EL PERSONAJE CAMINA;;;
        (display HUD)
        )
      )
  )

(define (funcion2)
  
  (define win1 (open-viewport "ventana" 1350 700))
  (((draw-pixmap-posn "luckywheel.jpg" 'unknown/mask ) win1) (make-posn 0 0))

  (define (maquina2 i b)   ;;;;;;;Juego de premios;;;;;;;;
  (if (>= (vector-ref HUD 2)5) ;;;;;;Verificacion del dinero;;;;;;
      (if (= b 5)
          (intentar (+ 5 i)0);;;;Premio 5;;;;;
          (if (= b 10)
              (intentar (+ 10 i)0);;;;Premio 10;;;;;
              (if (= b 25)
                  (intentar (+ 25 i)0);;;;Premio 25;;;;;
                  (if (= b 50)
                      (intentar (+ 50 i)0);;;;Premio 50;;;;;
                      )
                  )
              )
          )
      (display "No tiene dinero");;;;;;Aqui podria aparecer una ventana donde dice que no tiene dinero y cuando no tenga dinero se acaba el juego;;;;;;;;
      )
  )

(define (contadoranimacion2 i i1 i2 b) ;;;;;Animacion de la ruleta;;;;;;
  (if (< i1 i2)
      (begin
      (((draw-pixmap-posn "1.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "2.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "3.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "4.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "5.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "6.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "7.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (((draw-pixmap-posn "8.png" 'unknown/mask ) win1) (make-posn 430 148))(sleep 0.05)
      (contadoranimacion2 i (+ 1 i1)i2 b)
      )
      (if (= b 1)  ;;;;;Ultima imagen que dice el premio;;;;;
          (begin (((draw-pixmap-posn "1.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
          (if (= b 2)
              (begin (((draw-pixmap-posn "2.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "50mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 50))
              (if (= b 3)
                  (begin (((draw-pixmap-posn "3.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
                  (if (= b 4)
                      (begin (((draw-pixmap-posn "4.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "10mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 10))
                      (if (= b 5)
                          (begin (((draw-pixmap-posn "5.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
                          (if (= b 6)
                              (begin (((draw-pixmap-posn "6.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "25mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 25))
                              (if (= b 7)
                                  (begin (((draw-pixmap-posn "7.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "5mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 5))
                                  (if (= b 8)
                                      (begin (((draw-pixmap-posn "8.png" 'unknown/mask ) win1) (make-posn 430 148))(((draw-pixmap-posn "10mini.png" 'unknown/mask ) win1) (make-posn 205 341))(maquina2 i 10))
                                      )
                                  )
                              )
                          )
                      )
                  )
              )
          )
      )
  )

  
  (define (intentar i b) ;;;;;Volver a intentar;;;;;
 ;;;;;;;;;;;;;;AQUI;;;;;;;;;;;
    (if (= b 1)
        (begin
          (vector-set! HUD 2 (- i 10)) ;;;;Descuenta 10 para jugar;;;;;
          (contadoranimacion2 (vector-ref HUD 2) (- i 10)(+ 10 (random 10)) (+ 1 (random 8)))
          )
        (begin
          (vector-set! HUD 2 i) ;;;;OTRA VENTANA DONDE EL PERSONAJE CAMINA;;;
          (display HUD)
          )
        )
    )

  (define (ValidarClick c )  
  (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 260)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
      (begin
        (contadoranimacion2 (vector-ref HUD 2) 0 (+ 10 (random 10)) (+ 1 (random 8)))
        ;(close-viewport ventana)
        ;(close-graphics)
        )  
      (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 505)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
          (begin
            (close-viewport win1)
            (VentanaMiniMenu)
            )
          (EsperarClick)
          )
      )
 (EsperarClick))

(define (EsperarClick)
  (define c (get-mouse-click win1))
  (ValidarClick c))
(EsperarClick)

 )

(define (VentanaMiniMenu)
  (define ventana2(open-viewport "MiniMenu" 700 650))
   ((draw-pixmap ventana2)"MiniMenu.bmp"(make-posn 0 0)"violet")
  (define h (get-mouse-click ventana2))
  
 (if (and (and (<= (posn-x (mouse-click-posn h)) 488) (<= (posn-y (mouse-click-posn h)) 250)) (and (>= (posn-x (mouse-click-posn h)) 188) (>= (posn-y (mouse-click-posn h)) 180)))
      (begin
        (close-viewport ventana2)
        (funcion2)
        )
        (if (and (and (<= (posn-x (mouse-click-posn h)) 488) (<= (posn-y (mouse-click-posn h)) 325)) (and (>= (posn-x (mouse-click-posn h)) 188) (>= (posn-y (mouse-click-posn h)) 255)))
          (begin
            (close-viewport ventana2)
            (Movimientos)
            )
           (if (and (and (<= (posn-x (mouse-click-posn h)) 388) (<= (posn-y (mouse-click-posn h)) 400)) (and (>= (posn-x (mouse-click-posn h)) 268) (>= (posn-y (mouse-click-posn h)) 330)))
          (begin
            (close-viewport ventana2)
            ))))
  

  )



(define (ValidarClick c )  
  (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 260)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
      (begin
        (contadoranimacion2 (vector-ref HUD 2) 0 (+ 10 (random 10)) (+ 1 (random 8)))
        ;(close-viewport ventana)
        ;(close-graphics)
        )  
      (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 505)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
          (begin
            (close-viewport win1)
            (VentanaMiniMenu)
            )
          (EsperarClick)
          )
      )
 (EsperarClick))

(define (EsperarClick)
  (define c (get-mouse-click win1))
  (ValidarClick c))
(EsperarClick))
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;


(define (Jackpot)
  (define ventana (open-viewport "JACKPOT" 1350 700))
((draw-pixmap ventana)"pantalla.bmp"(make-posn 0 0)"violet")
  
(define (maquina i b1 b2 b3) ;;;;FUNCION DE LA MAQUINA;;;;;;;;;;
  (if (>= (vector-ref HUD 2)5) ;;;;SI TIENE MAS DE 5 PESOS PUEDE JUGAR;;;;;;;;;;;
      (if (and (= b1 b2)(= b1 b3)) ;;;;S LOS TRES SON IGUALES;;;;;
          (begin (+ 50 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "50mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 50))) ;+50;
          (if (= b1 b2) ;SI SON DOS IGUALES;+5;
              (begin (+ 5 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "5mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 5)))
              (if (= b1 b3);SI SON DOS IGUALES;+5;
                  (begin (+ 5 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "5mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 5)))
                  (if (= b2 b3)
                      (begin (+ 5 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "5mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 5)))
                      (begin (+ 0 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "0mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (- i 2)));CUANDO NiNGUNA ES IGUAL;
                      )
                  )
              )
          )
      (begin
        ((draw-string ventana)(make-posn 5 20)"El dinero no es suficiente: ")
        ((draw-string ventana)(make-posn 400 250) (vector-ref HUD 2))
        )
      )
  )

(define (intentar vec i) 
  ((draw-string ventana)(make-posn 5 20)"¿Desea volver a intentar?") ;;;;;;;;;;;;;;AQUI;;;;;;;;;;;
  (if (ready-mouse-click ventana)
      (if (and (and (<(posn-x(query-mouse-posn ventana))1350) (>(posn-x(query-mouse-posn ventana)) 0)) 
               (and (<(posn-y(query-mouse-posn ventana))700) (>(posn-y(query-mouse-posn ventana)) 0)))
          (begin
            (vector-set! vec 2 i)
            (contadoranimacion 0 (+ 1 (random 9))(+ 1 (random 9))(+ 1 (random 9)))
            )
          (begin
            (vector-set! vec 2 i) ;;;;OTRA VENTANA DONDE EL PERSONAJE CAMINA;;;
            (display vec)
            )
          )
      )
  )


(define (animacion x b1 b2 b3)  ;;;;ANIMACION;;;;;;;;;
  (if (= b1 1)((draw-pixmap ventana)"caballo5.bmp"(make-posn 185 260)"violet")
      (if (= b1 2)((draw-pixmap ventana)"corazon5.bmp"(make-posn 185 260)"violet")
          (if (= b1 3)((draw-pixmap ventana)"diamante5.bmp"(make-posn 185 260)"violet")
              (if (= b1 4)((draw-pixmap ventana)"limon5.bmp"(make-posn 185 260)"violet")
                  (if (= b1 5)((draw-pixmap ventana)"melon5.bmp"(make-posn 185 260)"violet")
                      (if (= b1 6)((draw-pixmap ventana)"ring5.bmp"(make-posn 185 260)"violet")
                          (if (= b1 7)((draw-pixmap ventana)"siete5.bmp"(make-posn 185 260)"violet")
                              (if (= b1 8)((draw-pixmap ventana)"cherry5.bmp"(make-posn 185 260)"violet")
                                  (if (= b1 9)((draw-pixmap ventana)"bar5.bmp"(make-posn 185 260)"violet")
                                      )))))))))
  (if (= b2 1)((draw-pixmap ventana)"caballo5.bmp"(make-posn 417 260)"violet")
      (if (= b2 2)((draw-pixmap ventana)"corazon5.bmp"(make-posn 417 260)"violet")
          (if (= b2 3)((draw-pixmap ventana)"diamante5.bmp"(make-posn 417 260)"violet")
              (if (= b2 4)((draw-pixmap ventana)"limon5.bmp"(make-posn 417 260)"violet")
                  (if (= b2 5)((draw-pixmap ventana)"melon5.bmp"(make-posn 417 260)"violet")
                      (if (= b2 6)((draw-pixmap ventana)"ring5.bmp"(make-posn 417 260)"violet")
                          (if (= b2 7)((draw-pixmap ventana)"siete5.bmp"(make-posn 417 260)"violet")
                              (if (= b2 8)((draw-pixmap ventana)"cherry5.bmp"(make-posn 417 260)"violet")
                                  (if (= b2 9)((draw-pixmap ventana)"bar5.bmp"(make-posn 417 260)"violet")
                                      )))))))))
  (if  (= b3 1)((draw-pixmap ventana)"caballo5.bmp"(make-posn 643 260)"violet")
       (if  (= b3 2)((draw-pixmap ventana)"corazon5.bmp"(make-posn 643 260)"violet")
            (if  (= b3 3)((draw-pixmap ventana)"diamante5.bmp"(make-posn 643 260)"violet")
                 (if  (= b3 4)((draw-pixmap ventana)"limon5.bmp"(make-posn 643 260)"violet")
                      (if  (= b3 5)((draw-pixmap ventana)"melon5.bmp"(make-posn 643 260)"violet")
                           (if  (= b3 6)((draw-pixmap ventana)"ring5.bmp"(make-posn 643 260)"violet")
                                (if  (= b3 7)((draw-pixmap ventana)"siete5.bmp"(make-posn 643 260)"violet")
                                     (if  (= b3 8)((draw-pixmap ventana)"cherry5.bmp"(make-posn 643 260)"violet")
                                          (if  (= b3 9)((draw-pixmap ventana)"bar5.bmp"(make-posn 643 260)"violet")
                                               )))))))))
  (contadoranimacion (+ 1 x)b1 b2 b3)
  )

(define (contadoranimacion x b1 b2 b3) ;;;;;TIEMPO DE LA ANIMACION;;;;;;;;;;
  (if (<= x 200)
      (animacion x (+ 1 (random 9))(+ 1 (random 9))(+ 1 (random 9)))
      (maquina (vector-ref HUD 2) b1 b2 b3)
      )
  )

(define (funcion)
  (define ventana (open-viewport "ventana" 1350 700))
((draw-pixmap ventana)"pantalla.bmp"(make-posn 0 0)"violet")

  (define (maquina i b1 b2 b3) ;;;;FUNCION DE LA MAQUINA;;;;;;;;;;
  (if (>= (vector-ref HUD 2)5) ;;;;SI TIENE MAS DE 5 PESOS PUEDE JUGAR;;;;;;;;;;;
      (if (and (= b1 b2)(= b1 b3)) ;;;;S LOS TRES SON IGUALES;;;;;
          (begin (+ 50 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "50mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 50))) ;+50;
          (if (= b1 b2) ;SI SON DOS IGUALES;+5;
              (begin (+ 5 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "5mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 5)))
              (if (= b1 b3);SI SON DOS IGUALES;+5;
                  (begin (+ 5 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "5mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 5)))
                  (if (= b2 b3)
                      (begin (+ 5 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "5mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (+ i 5)))
                      (begin (+ 0 i)(displayln b1)(displayln b2)(displayln b3)(((draw-pixmap-posn "0mini.png" 'unknown/mask ) ventana) (make-posn 540 565))(intentar HUD (- i 2)));CUANDO NiNGUNA ES IGUAL;
                      )
                  )
              )
          )
      (begin
        ((draw-string ventana)(make-posn 5 20)"El dinero no es suficiente: ")
        ((draw-string ventana)(make-posn 400 250) (vector-ref HUD 2))
        )
      )
  )

(define (intentar vec i) 
  ((draw-string ventana)(make-posn 5 20)"¿Desea volver a intentar?") ;;;;;;;;;;;;;;AQUI;;;;;;;;;;;
  (if (ready-mouse-click ventana)
      (if (and (and (<(posn-x(query-mouse-posn ventana))1350) (>(posn-x(query-mouse-posn ventana)) 0)) 
               (and (<(posn-y(query-mouse-posn ventana))700) (>(posn-y(query-mouse-posn ventana)) 0)))
          (begin
            (vector-set! vec 2 i)
            (contadoranimacion 0 (+ 1 (random 9))(+ 1 (random 9))(+ 1 (random 9)))
            )
          (begin
            (vector-set! vec 2 i) ;;;;OTRA VENTANA DONDE EL PERSONAJE CAMINA;;;
            (display vec)
            )
          )
      )
  )
  
  (define (animacion x b1 b2 b3)  ;;;;ANIMACION;;;;;;;;;
  (if (= b1 1)((draw-pixmap ventana)"caballo5.bmp"(make-posn 185 260)"violet")
      (if (= b1 2)((draw-pixmap ventana)"corazon5.bmp"(make-posn 185 260)"violet")
          (if (= b1 3)((draw-pixmap ventana)"diamante5.bmp"(make-posn 185 260)"violet")
              (if (= b1 4)((draw-pixmap ventana)"limon5.bmp"(make-posn 185 260)"violet")
                  (if (= b1 5)((draw-pixmap ventana)"melon5.bmp"(make-posn 185 260)"violet")
                      (if (= b1 6)((draw-pixmap ventana)"ring5.bmp"(make-posn 185 260)"violet")
                          (if (= b1 7)((draw-pixmap ventana)"siete5.bmp"(make-posn 185 260)"violet")
                              (if (= b1 8)((draw-pixmap ventana)"cherry5.bmp"(make-posn 185 260)"violet")
                                  (if (= b1 9)((draw-pixmap ventana)"bar5.bmp"(make-posn 185 260)"violet")
                                      )))))))))
  (if (= b2 1)((draw-pixmap ventana)"caballo5.bmp"(make-posn 417 260)"violet")
      (if (= b2 2)((draw-pixmap ventana)"corazon5.bmp"(make-posn 417 260)"violet")
          (if (= b2 3)((draw-pixmap ventana)"diamante5.bmp"(make-posn 417 260)"violet")
              (if (= b2 4)((draw-pixmap ventana)"limon5.bmp"(make-posn 417 260)"violet")
                  (if (= b2 5)((draw-pixmap ventana)"melon5.bmp"(make-posn 417 260)"violet")
                      (if (= b2 6)((draw-pixmap ventana)"ring5.bmp"(make-posn 417 260)"violet")
                          (if (= b2 7)((draw-pixmap ventana)"siete5.bmp"(make-posn 417 260)"violet")
                              (if (= b2 8)((draw-pixmap ventana)"cherry5.bmp"(make-posn 417 260)"violet")
                                  (if (= b2 9)((draw-pixmap ventana)"bar5.bmp"(make-posn 417 260)"violet")
                                      )))))))))
  (if  (= b3 1)((draw-pixmap ventana)"caballo5.bmp"(make-posn 643 260)"violet")
       (if  (= b3 2)((draw-pixmap ventana)"corazon5.bmp"(make-posn 643 260)"violet")
            (if  (= b3 3)((draw-pixmap ventana)"diamante5.bmp"(make-posn 643 260)"violet")
                 (if  (= b3 4)((draw-pixmap ventana)"limon5.bmp"(make-posn 643 260)"violet")
                      (if  (= b3 5)((draw-pixmap ventana)"melon5.bmp"(make-posn 643 260)"violet")
                           (if  (= b3 6)((draw-pixmap ventana)"ring5.bmp"(make-posn 643 260)"violet")
                                (if  (= b3 7)((draw-pixmap ventana)"siete5.bmp"(make-posn 643 260)"violet")
                                     (if  (= b3 8)((draw-pixmap ventana)"cherry5.bmp"(make-posn 643 260)"violet")
                                          (if  (= b3 9)((draw-pixmap ventana)"bar5.bmp"(make-posn 643 260)"violet")
                                               )))))))))
  (contadoranimacion (+ 1 x)b1 b2 b3)
  )

(define (contadoranimacion x b1 b2 b3) ;;;;;TIEMPO DE LA ANIMACION;;;;;;;;;;
  (if (<= x 200)
      (animacion x (+ 1 (random 9))(+ 1 (random 9))(+ 1 (random 9)))
      (maquina (vector-ref HUD 2) b1 b2 b3)
      )
  )

  (define (ValidarClick c )  
  (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 260)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
      (begin
        (contadoranimacion 0 (+ 1 (random 9))(+ 1 (random 9))(+ 1 (random 9)))
        )  
      (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 505)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
          (begin
            (close-viewport ventana)
            (VentanaMiniMenu)
            )
          (EsperarClick)
          )
      )
 (EsperarClick))

(define (EsperarClick)
  (define c (get-mouse-click ventana))
  (ValidarClick c))
(EsperarClick)

  )



(define (VentanaMiniMenu)
  (define ventana2(open-viewport "MiniMenu" 700 650))
   ((draw-pixmap ventana2)"MiniMenu.bmp"(make-posn 0 0)"violet")
  (define h (get-mouse-click ventana2))
  
  (if (and (and (<= (posn-x (mouse-click-posn h)) 488) (<= (posn-y (mouse-click-posn h)) 250)) (and (>= (posn-x (mouse-click-posn h)) 188) (>= (posn-y (mouse-click-posn h)) 180)))
      (begin
        (close-viewport ventana2)
        (funcion)
        )
      (if (and (and (<= (posn-x (mouse-click-posn h)) 488) (<= (posn-y (mouse-click-posn h)) 325)) (and (>= (posn-x (mouse-click-posn h)) 188) (>= (posn-y (mouse-click-posn h)) 255)))
          (begin
            (close-viewport ventana2)
            (Movimientos)
            )
           (if (and (and (<= (posn-x (mouse-click-posn h)) 388) (<= (posn-y (mouse-click-posn h)) 400)) (and (>= (posn-x (mouse-click-posn h)) 268) (>= (posn-y (mouse-click-posn h)) 330)))
          (begin
            (close-viewport ventana2)
            ))))
  )





(define (ValidarClick c )  
  (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 260)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
      (begin
        (contadoranimacion 0 (+ 1 (random 9))(+ 1 (random 9))(+ 1 (random 9)))

        )  
      (if (and (and (<= (posn-x (mouse-click-posn c)) 1272) (<= (posn-y (mouse-click-posn c)) 505)) (and (>= (posn-x (mouse-click-posn c)) 1022) (>= (posn-y (mouse-click-posn c)) 165)))
          (begin
            (close-viewport ventana)
            (VentanaMiniMenu)
            )
          (EsperarClick)
          )
      )
 (EsperarClick))

(define (EsperarClick)
  (define c (get-mouse-click ventana))
  (ValidarClick c))
(EsperarClick))
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;
(define (tiendaPersonajes)
(define win1 (open-viewport "TIENDA" 1350 700))
((draw-pixmap win1)"characters.bmp"(make-posn 0 0)"violet")

 
(define (character win1 a b c d)
  ;((draw-rectangle win1)(make-posn 110 155)260 410 "white")
  ;((draw-rectangle win1)(make-posn 390 155)260 410 "white")
  ;((draw-rectangle win1)(make-posn 678 155)260 410 "white")
  ;((draw-rectangle win1)(make-posn 953 155)260 410 "white")
  ;((draw-rectangle win1)(make-posn 1213 0)130 150 "white")
  (define h (get-mouse-click win1))
  (if (and (and (<= (posn-x (mouse-click-posn h)) 370) (<= (posn-y (mouse-click-posn h)) 565));;Click en el personaje que desea obtener;;
           (and (>= (posn-x (mouse-click-posn h)) 110) (>= (posn-y (mouse-click-posn h)) 410)))
      
      
      
      (if (>= (tienda-char1 (vector-ref HUD 0))1)    ;;Si ya lo tiene no se le cobra el precio y sigue en la misma ventana hasta que le unda en salir;;
          (begin (vector-set! HUD 1 1)(character win1 a b c d))   ;;No se cobra y se selecciona al personaje en el vector;;
          (if (>= (vector-ref HUD 2)20)               ;;Se verifica si tiene dinero para comprar el personaje;;
              (begin (Comprado)(vector-set! HUD 1 1)(vector-set! HUD 0 (make-tienda 1 b c d))(vector-set! HUD 2 (- (vector-ref HUD 2)20))(character win1 1 b c d))  ;;condicion cuando tenga dinero;;
              (begin (noDineroPersonaje)(character win1 a b c d))
              ))

      
   (if (and (and (<= (posn-x (mouse-click-posn h)) 650) (<= (posn-y (mouse-click-posn h)) 565))  ;;Click en el personaje que desea obtener;;
            (and (>= (posn-x (mouse-click-posn h)) 390) (>= (posn-y (mouse-click-posn h)) 410)))
       
      
       
       (if (>= (tienda-char2 (vector-ref HUD 0))1)    ;;Si ya lo tiene no se le cobra el precio y sigue en la misma ventana hasta que le unda en salir;;
          (begin (vector-set! HUD 1 2)(character win1 a b c d))   ;;No se cobra y se selecciona al personaje en el vector;;
          (if (>= (vector-ref HUD 2)70)               ;;Se verifica si tiene dinero para comprar el personaje;;
              (begin (Comprado)(vector-set! HUD 1 2)(vector-set! HUD 0 (make-tienda a 1 c d))(vector-set! HUD 2 (- (vector-ref HUD 2)70)) (character win1 a 1 c d))  ;;condicion cuando tenga dinero;;
              (begin (noDineroPersonaje)(character win1 a b c d))
              ))

       
  (if (and (and (<= (posn-x (mouse-click-posn h)) 938) (<= (posn-y (mouse-click-posn h)) 565)) 
           (and (>= (posn-x (mouse-click-posn h)) 638) (>= (posn-y (mouse-click-posn h)) 410)))
                            ;((draw-rectangle win1)(make-posn 678 155)260 410 "white")
      
       (if (>= (tienda-char3 (vector-ref HUD 0))1)    
          (begin (vector-set! HUD 1 3)(character win1 a b c d))
          (if (>= (vector-ref HUD 2)120)            
              (begin (Comprado)(vector-set! HUD 1 3)(vector-set! HUD 0 (make-tienda a b 1 d))(vector-set! HUD 2 (- (vector-ref HUD 2)120)) (character win1 a b 1 d))  ;;condicion cuando tenga dinero;;
              (begin (noDineroPersonaje)(character win1 a b c d))
              ))
 (if (and (and (<= (posn-x (mouse-click-posn h)) 1213) (<= (posn-y (mouse-click-posn h)) 565)) 
          (and (>= (posn-x (mouse-click-posn h)) 953) (>= (posn-y (mouse-click-posn h)) 410)))

     
      (if (>= (tienda-char4 (vector-ref HUD 0))1)    
          (begin (vector-set! HUD 1 4)(character win1 a b c d))
          (if (>= (vector-ref HUD 2)120)            
              (begin (Comprado)(vector-set! HUD 1 4)(vector-set! HUD 0 (make-tienda a b c 1))(vector-set! HUD 2 (- (vector-ref HUD 2)200)) (character win1 a b c 1))  ;;condicion cuando tenga dinero;;
              (begin (noDineroPersonaje)(character win1 a b c d))
              ))
      
 (if (and (and (<= (posn-x (mouse-click-posn h)) 1343) (<= (posn-y (mouse-click-posn h)) 150)) 
          (and (>= (posn-x (mouse-click-posn h)) 1213) (>= (posn-y (mouse-click-posn h)) 0)))
     (begin (close-viewport win1)(Movimientos))
     (character win1 a b c d)
     ))))))
       
(character win1 (tienda-char1(vector-ref HUD 0))(tienda-char2(vector-ref HUD 0))(tienda-char3(vector-ref HUD 0))(tienda-char4(vector-ref HUD 0)))
)
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------;;
(define (noDineroPersonaje)
  (define ventana2 (open-viewport "NO TIENE DINERO" 700 650))
  ((draw-pixmap ventana2)"noDinero.bmp"(make-posn 0 0)"violet")
  (sleep 3)
  (close-viewport ventana2)
  )
(define (Comprado)
  (define ventana2 (open-viewport "PERSONAJE COMPRADO" 700 650))
  ((draw-pixmap ventana2)"Comprado.bmp"(make-posn 0 0)"violet")
  (sleep 3)
  (close-viewport ventana2)
  )

(principal)
;--------------------Santiago Florez-----------------------------------------Santiago Mejia----------------------------------------------------------------;