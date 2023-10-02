;;IN2040 oblig1a simontha

;;Oppgave 1
;;A) 30 -> (4+2) * 5 = 6*5 = 30 
;;B) feil, forventet en prosedyre, fikk 5. (5) kan ikke tolkes alene, det første element i en "parentes-blokk" skal være en prosedyre
;;C) feil, forventet prosedyre, fikk 4. Samme som i B, men (4+2) istedenfor
;;D) 22. Definerer bar som verdien 44/2 = 22, bar er da 22.
;;E) 11, dersom bar er definert som i oppgave D. bar - 11 = 22 - 11 = 11
;;F) 12, dersom bar er definert som i oppgave D. (bar * 3 * 4 * 1) / bar = (bar * 12) / bar = 12.

;;Oppgave 2
;;A)
;; Det første uttrykket evaluerer til "paff!", selv om det finnes ugyldig syntaks,
;;siden det første uttrykket evaluerer til false, og siden det er i en OR-block så går den
;;videre til neste, altså "paff!", dette evaluerer til sant, så den sjekker ikke de andre ugyldige uttrykkene

;;Det andre uttrykket evaluerer til #f siden det er en AND, som vil si at alle uttrykkene må være sanne. Det første er usant, dvs hele uttrykket kan aldri bli sant.

;;Det tredje utrykket kan ikke evalueres ettersom den udefinerte prosedyren ikke har noen definisjon.
;;

;; AND, OR, IF er special forms i henhold til eksemplene siden i uttrykk 1 evalueres kun
;;Det første uttrykket, før den avslutter. Hadde den fulgt standard evalueringsregler
;;så måtte alle uttrykkene evalueres før OR og det ville oppstått en "application: not a procedure" feil.


;;B)
(define (sign n)
  (cond ((zero? n) 0)
        ((> n 0) 1)
        ((< n 0) -1)))

        
(define (sign2 n)
  (if (zero? n)
      0
      (if (> n 0)
      1
      (- 0 1))));;litt tricky løsning, display -1 fungerte ikke, fant ingen kul måte å gjøre det på.
;;(sign -69)
;;(sign 420)
;;(sign 0)

;;C)
(define (sign3 n)
  (or (or
    (and (zero? n) 0)
    (and (> 0 n) -1))
   (and (< 0 n) 1)))

;;(sign3 -69)
;;(sign3 420)
;;(sign3 0)

;;Oppgave 3
;A)
(define (add1 n)
  (+ n 1))
(define (sub1 n)
  (- n 1))
;;B)
(define (plus n m)
   (if (zero? m)
       n
       (plus (add1 n) (sub1 m))))
;;(plus 11 10)

;;C)
;;Prosessen fra prosedyren over er rekursiv, ettersom det rekursive kallet er det siste som utføres i prosedyren.
;;En iterativ variant?:
(define (plus-iter n m)
  (define (iter acc count)
    (if (> count m)
        acc
        (iter (add1 acc)
              (add1 count))))
    (iter n 1))
;;(plus-iter 15 20)

;;D)
(define (power-close-to b n)
  (define (power-iter b n e)
  (if (> (expt b e) n)
      e
      (power-iter b n (+ 1 e))))
  (power-iter b n 1))

(define (power-close-to-simplified b n)
  (define (power-iter e)
  (if (> (expt b e) n)
      e
      (power-iter (+ 1 e))))
  (power-iter 1))

;;E)
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
;;(fib 10)
;;Nei den kan ikke forenkles mer, ettersom N i fib ikke er det samme som sendes inn i de rekursive kallene til fib-iter, altså alle parametrene må være med,
;;siden man må sende inn n-1 for at den skal fungere.





   
