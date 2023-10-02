;; Oppgave 1
(define bar 10)
;;F
(car (cdr '(0 42 #t bar)))

;;G
(car (cdr (car '((0 42) (#t bar)))))

;;H
(car (car (cdr '((0) (42 #t) (bar)))))

;;i
;;CONS
(cons
 (cons 0 (cons 42 '()))
 (cons #t (cons bar '()))
 )
;;Forstod ikke helt om man skulle lage de som en "liste" eller par,
;;med løsningen under så kommer . med på REPL'en men idk...
(cons (cons 0 42) (cons #t bar))

;;list
(list (list 0 42) (list #t bar))


;;OPPGAVE 2
;;A
(define (take n items)
  (if (or (zero? n) (null? items))
      '()
  (cons (car items)
        (take (- n 1)
              (cdr items)))))
;;(take 3 '(a b c d e f g h))
;;(take 14 '(a b c d e f g h))
;;(take 0 '(a b c d e f g h))
;;(take 4 '())

;;C
(define (take-while pred items)
  (if (not (pred (car items)))
      '()
  (cons (car items)
        (take-while pred
              (cdr items)))))

;;(take-while even? '(2 34 42 75 88 103 250))
;;(take-while odd? '(2 34 42 75))
;;(take-while (lambda (x) (< x 100)) '(2 34 42 75 88 103 250))

;;D
