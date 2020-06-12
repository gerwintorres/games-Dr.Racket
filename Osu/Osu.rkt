(require (lib "graphics.ss" "graphics"))
(open-graphics)

(define osu (open-viewport "osu" 900 700))

(define (teclaN x y v)
  (if (< y 551)
      (begin
        (sleep 0.001)
        ((draw-solid-rectangle osu)(make-posn x (- y v)) 140 50 "white") 
        ((draw-solid-rectangle osu)(make-posn x y) 140 50 (make-rgb 0.5 0.5 1))
        (teclaN x (+ y v) v)
        )
      (if (and (>= y 551) (< y 600))
          (begin
            (sleep 0.001)
             ((draw-solid-rectangle osu)(make-posn x (- y v)) 140 50 "white")
            )
          )
      )
  )

(define (teclaD x y v)
  (if (< y 551)
      (begin
        (sleep 0.001)
        ((draw-solid-rectangle osu)(make-posn x (- y v)) 140 50 "white") 
        ((draw-solid-rectangle osu)(make-posn x y) 140 50 "gray")
        (teclaD x (+ y v) v)
        )
      (if (and (>= y 551) (< y 600))
          (begin
            (sleep 0.001)
             ((draw-solid-rectangle osu)(make-posn x (- y v)) 140 50 "white")
            )
          )
      )
  )

(define (teclaI x y v)
  (if (< y 551)
      (begin
        (sleep 0.001)
        ((draw-solid-rectangle osu)(make-posn x (- y v)) 140 50 "white") 
        ((draw-solid-rectangle osu)(make-posn x y) 140 50 "red")
        (teclaI x (+ y v) v)
        )
      (if (and (>= y 551) (< y 600))
          (begin
            (sleep 0.001)
             ((draw-solid-rectangle osu)(make-posn x (- y v)) 140 50 "white")
            )
          )
      )
  )
(define vec (make-vector 1 0))
(define (recordA v key)
  (if (equal? key #\a)
      (begin
        (vector-set! vec 0 (+ (vector-ref vec 0) 10))
        (displayln (vector-ref vec 0))
        )
      (displayln (vector-ref vec 0))
      )
  )
(define (recordS v key)
  (if (equal? key #\s)
      (begin
        (vector-set! vec 0 (+ (vector-ref vec 0) 10))
        (displayln (vector-ref vec 0))
        )
      (displayln (vector-ref vec 0))
      )
  )
(define (recordD v key)
  (if (equal? key #\d)
      (begin
        (vector-set! vec 0 (+ (vector-ref vec 0) 10))
        (displayln (vector-ref vec 0))
        )
      (displayln (vector-ref vec 0))
      )
  )
(define (recordJ v key)
  (if (equal? key #\j)
      (begin
        (vector-set! vec 0 (+ (vector-ref vec 0) 10))
        (displayln (vector-ref vec 0))
        )
      (displayln (vector-ref vec 0))
      )
  )
(define (recordK v key)
  (if (equal? key #\k)
      (begin
        (vector-set! vec 0 (+ (vector-ref vec 0) 10))
        (displayln (vector-ref vec 0))
        )
      (displayln (vector-ref vec 0))
      )
  )
(define (recordL v key)
  (if (equal? key #\l)
      (begin
        (vector-set! vec 0 (+ (vector-ref vec 0) 10))
        (displayln (vector-ref vec 0))
        )
      (displayln (vector-ref vec 0))
      )
  )

((draw-pixmap osu) "OSU.png" (make-posn -100 0))
((draw-solid-rectangle osu)(make-posn 0 0) 900 100 "black")
((draw-solid-rectangle osu)(make-posn 0 660) 900 100 "black")
((draw-pixmap osu) "UTP.png" (make-posn 10 10))

((draw-string osu) (make-posn 20 260) "SELECCIONE UN NIVEL:" "BLACK")
((draw-string osu) (make-posn 20 340) "OUTCRY: PRESIONE 1" "BLACK")
((draw-string osu) (make-posn 20 380) "MÉLANCOLIE: PRESIONE 2" "BLACK")
((draw-string osu) (make-posn 20 420) "DIVINITY: PRESIONE 3" "BLACK")
((draw-string osu) (make-posn 760 690) "Juan Manuel Ruiz S." "White")

(define (mapa)
  ((draw-solid-rectangle osu)(make-posn 0 600) 80 100 "black")
  ((draw-solid-rectangle osu)(make-posn 0 600) 900 100 (make-rgb 0.6 0.6 0.6))
  ((draw-string osu) (make-posn 70 650) "A" "black")
  ((draw-string osu) (make-posn 220 650) "S" "black")
  ((draw-string osu) (make-posn 370 650) "D" "black")
  ((draw-string osu) (make-posn 520 650) "J" "black")
  ((draw-string osu) (make-posn 670 650) "K" "black")
  ((draw-string osu) (make-posn 820 650) "L" "black")
  ((draw-line osu) (make-posn 0 600)(make-posn 900 600) "black")
  ((draw-line osu) (make-posn 150 0)(make-posn 150 700) "black")
  ((draw-line osu) (make-posn 300 0)(make-posn 300 700) "black")
  ((draw-line osu) (make-posn 450 0)(make-posn 450 700) "black")
  ((draw-line osu) (make-posn 600 0)(make-posn 600 700) "black")
  ((draw-line osu) (make-posn 750 0)(make-posn 750 700) "black")
  )

(define (nivel2)

  (play-sound "Melancolie.mp3" #t)

  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 305 0 4)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 455 0 4)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 305 0 4)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 5 0 4)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 755 0 4)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 5 0 4)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 305 0 4)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 455 0 4)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 755 0 4)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 5 0 4)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 305 0 4)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 755 0 4)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.06)
  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.05)
  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  ;drop

  (sleep 2.2)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  ;drop 2

  (sleep 0.54)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;drop 3

  (sleep 0.54)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.63)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  ;drop 4

  (sleep 0.54)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;drop 5

  (sleep 0.54)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;drop 6

  (sleep 0.54)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  ;drop 7

  (sleep 0.8)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;drop 8

  (sleep 0.54)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  ;drop 10

  (sleep 0.8)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.54)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  ;drop 11

  (sleep 0.8)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.54)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.33)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.02)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.49)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.18)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.3)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 3)
  ((draw-solid-rectangle osu)(make-posn 0 0) 900 700 "black")
  ((draw-string osu) (make-posn 400 380) "NIVEL COMPLETADO" "white")

  (sleep 3)
  (close-viewport osu)

  )

(define (nivel3)
  (play-sound "Divinity.mp3" #t)

  (sleep 0.88)
  (teclaN 155 0 3)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.88)
  (teclaN 305 0 3)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.88)
  (teclaN 605 0 3)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.88)
  (teclaN 305 0 3)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.88)
  (teclaN 5 0 3)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.88)
  (teclaN 455 0 3)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.88)
  (teclaN 755 0 3)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 2.5)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.12)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.13)
  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  ;drop

  (sleep 5.72)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  ;drop 2

  (sleep 0.24)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  ;drop 3

  (sleep 0.65)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;drop 4

  (sleep 0.36)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  ;drop 5

  (sleep 0.36)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))


  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 3)
  ((draw-solid-rectangle osu)(make-posn 0 0) 900 700 "black")
  ((draw-string osu) (make-posn 400 380) "NIVEL COMPLETADO" "white")

  (sleep 3)
  (close-viewport osu)
  )

(define (nivel1)
  (play-sound "Outcry.mp3" #t)

  (sleep 0.8)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 1.4)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 1.3)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 1.5)

  (teclaN 5 0 4)
  (recordA vec (key-value (get-key-press osu)))

  (teclaN 305 0 4)
  (recordD vec (key-value (get-key-press osu)))

  (teclaN 605 0 4)
  (recordK vec (key-value (get-key-press osu)))

  (teclaN 155 0 4)
  (recordS vec (key-value (get-key-press osu)))

  ;drop

  (sleep 0.25)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.25)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.43)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;interlude

  (sleep 0.37)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  ;drop

  (sleep 0.25)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.32)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 1.6)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.8)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  ;drop 2

  (sleep 2.1)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.25)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.43)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;interlude

  (sleep 0.37)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  ;drop

  (sleep 0.25)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.32)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 1.6)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.8)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  ;drop 3

  (sleep 2.1)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.25)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.43)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;interlude

  (sleep 0.37)
  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  ;drop

  (sleep 0.25)
  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.32)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 1.6)
  (teclaD 755 0 8)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.8)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  ;drop 4

  (sleep 2.1)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.25)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 305 0 15)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 605 0 15)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.23)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.43)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  ;interlude

  (sleep 0.37)
  (teclaD 605 0 8)
  (recordK vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 305 0 8)
  (recordD vec (key-value (get-key-press osu)))

  (sleep 0.03)
  (teclaD 5 0 8)
  (recordA vec (key-value (get-key-press osu)))

  ;drop

  (sleep 0.25)
  (teclaI 755 0 15)
  (recordL vec (key-value (get-key-press osu)))

  (sleep 0.22)
  (teclaI 155 0 15)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.32)
  (teclaI 5 0 15)
  (recordA vec (key-value (get-key-press osu)))

  (teclaI 455 0 15)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 1.6)
  (teclaD 155 0 8)
  (recordS vec (key-value (get-key-press osu)))

  (sleep 0.8)
  (teclaD 455 0 8)
  (recordJ vec (key-value (get-key-press osu)))

  (sleep 3)
  ((draw-solid-rectangle osu)(make-posn 0 0) 900 700 "black")
  ((draw-string osu) (make-posn 400 380) "NIVEL COMPLETADO" "white")

  (sleep 3)
  (close-viewport osu)
  )

(define (niveles n)
  ((draw-solid-rectangle osu)(make-posn 0 0) 900 700 "white")
  (cond
    ((equal? n #\1)
     (mapa)
     (nivel1))
    ((equal? n #\2)
     (mapa)
     (nivel2))
    ((equal? n #\3)
     (mapa)
     (nivel3))
    )
  )
(niveles (key-value (get-key-press osu)))