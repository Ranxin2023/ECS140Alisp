;;;;;;;;;;;;;;;;;;;;;;;;
;;; pre-testing prep ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

(load "../lisp-unit.lisp")

(use-package :lisp-unit)

(load "matrix.lisp")

(remove-tests :all)

(setq *print-failures* t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; matrix-add test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-matrix-add
    (assert-equal '((1 1)) (matrix-add '((0 0)) '((1 1))))
    (assert-equal '((1) (1)) (matrix-add '((0) (0)) '((1) (1))))
    (assert-equal '((2 1 1) (1 2 1) (1 1 2)) (matrix-add '((1 0 0) (0 1 0) (0 0 1)) '((1 1 1) (1 1 1) (1 1 1))))
    (assert-equal '((1 2 3 4) (1 2 3 4) (1 2 3 4)) (matrix-add '((1 2 3 4) (1 2 3 4) (1 2 3 4)) '((0 0 0 0) (0 0 0 0) (0 0 0 0))))
    (assert-equal '((0 0 0) (0 0 0) (0 0 0) (0 0 0)) (matrix-add '((0 0 0) (0 0 0) (0 0 0) (0 0 0)) '((0 0 0) (0 0 0) (0 0 0) (0 0 0))))
    (assert-equal '((0)) (matrix-add '((0)) '((0))))
    (assert-equal '((24)) (matrix-add '((9)) '((15))))
    (assert-equal '((4 3) (3 4)) (matrix-add '((1 2) (2 1)) '((3 1) (1 3))))
    (assert-equal '((9 11 13) (16 18 20)) (matrix-add '((1 2 3) (5 6 7)) '((8 9 10) (11 12 13))))
    (assert-equal '((-7 7 -7) (-16 18 -6)) (matrix-add '((1 -2 3) (-5 6 7)) '((-8 9 -10) (-11 12 -13))))
    (assert-equal '((-7) (4) (-4) (-4)) (matrix-add '((1) (-5) (6) (7)) '((-8) (9) (-10) (-11))))
    (assert-equal '((-7 7 -7)) (matrix-add '((1 -2 3)) '((-8 9 -10))))
    (assert-equal '((-7 7 -7 9 11)) (matrix-add '((1 -2 3 4 5)) '((-8 9 -10 5 6))))
    (assert-equal '((-7 7) (-16 18) (22 24)) (matrix-add '((1 -2) (-5 6) (8 9)) '((-8 9) (-11 12) (14 15))))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; matrix-multiply test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-matrix-multiply
    (assert-equal '((0)) (matrix-multiply '((1 1)) '((0) (0)) ))
    (assert-equal '((0 0) (0 0)) (matrix-multiply '((0) (0)) '((1 1))))
    (assert-equal '((1 2 3) (4 5 6) (7 8 9)) (matrix-multiply '((1 2 3) (4 5 6) (7 8 9)) '((1 0 0) (0 1 0) (0 0 1))))
    (assert-equal '((1 2 3) (4 5 6) (7 8 9) (10 11 12)) (matrix-multiply '((1 2 3) (4 5 6) (7 8 9) (10 11 12)) '((1 0 0) (0 1 0) (0 0 1))))
    (assert-equal '((70 80 90) (158 184 210) (246 288 330)) (matrix-multiply '((1 2 3 4) (5 6 7 8) (9 10 11 12)) '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))
    (assert-equal '((5 7) (7 5)) (matrix-multiply '((1 2) (2 1)) '((3 1) (1 3))))
    (assert-equal '((21 24 27) (18 21 24)) (matrix-multiply '((1 2) (2 1)) '((5 6 7) (8 9 10))))
    (assert-equal '((21 -24 27) (18 -21 24)) (matrix-multiply '((1 -2) (2 -1)) '((5 -6 7) (-8 9 -10))))
    (assert-equal '((0 1 1) (0 0 -1)) (matrix-multiply '((1 0) (-1 1)) '((0 1 1) (0 1 0))))
    (assert-equal '((0 0 0) (0 0 0)) (matrix-multiply '((0 0) (0 0)) '((0 0 0) (0 0 0))))
    (assert-equal '((23 26 29 32) (19 22 25 28)) (matrix-multiply '((1 2) (2 1)) '((5 6 7 8) (9 10 11 12))))
    (assert-equal '((70)) (matrix-multiply '((1 0 1 9)) '((9) (8) (7) (6))))
    (assert-equal '((23 -14 29 42) (19 2 25 48)) (matrix-multiply '((1 2) (2 1)) '((5 6 7 18) (9 -10 11 12))))
    (assert-equal '((283)) (matrix-multiply '((1 0 11 9)) '((9) (8) (20) (6))))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; matrix-transpose test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-matrix-transpose
    (assert-equal '((0) (0)) (matrix-transpose '((0 0))))
    (assert-equal '((1 1)) (matrix-transpose '((1) (1))))
    (assert-equal '((1 0 0) (0 1 0) (0 0 1)) (matrix-transpose '((1 0 0) (0 1 0) (0 0 1))))
    (assert-equal '((1 1 1) (2 2 2) (3 3 3) (4 4 4)) (matrix-transpose '((1 2 3 4) (1 2 3 4) (1 2 3 4))))
    (assert-equal '((0 0 0 0) (0 0 0 0) (0 0 0 0)) (matrix-transpose '((0 0 0) (0 0 0) (0 0 0) (0 0 0))))
    (assert-equal '((1 3) (2 4)) (matrix-transpose '((1 2) (3 4))))
    (assert-equal '((1 3 5) (2 4 6)) (matrix-transpose '((1 2) (3 4) (5 6))))
    (assert-equal '((A C E G) (B D F H)) (matrix-transpose '((A B) (C D) (E F) (G H))))
    (assert-equal '((A E) (B F) (C G) (D H)) (matrix-transpose '((A B C D) (E F G H))))
    (assert-equal '((A F) (B G) (C H) (D I) (E J)) (matrix-transpose '((A B C D E) (F G H I J))))
    (assert-equal '((A) (B) (C) (D) (E)) (matrix-transpose '((A B C D E))))
    (assert-equal '((A B C D E)) (matrix-transpose '((A) (B) (C) (D) (E))))
    (assert-equal '((A C E G) (B D F H) (C E G I)) (matrix-transpose '((A B C) (C D E) (E F G) (G H I))))
)
;;;;;;;;;;;;;;;;;
;;; run tests ;;;
;;;;;;;;;;;;;;;;;

(run-tests :all)
