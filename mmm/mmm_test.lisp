;;;;;;;;;;;;;;;;;;;;;;;;
;;; pre-testing prep ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

(load "../lisp-unit.lisp")

(use-package :lisp-unit)

(load "mmm.lisp")

(remove-tests :all)

(setq *print-failures* t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; min-mean-max test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-min-mean-max
    (assert-equal '(2 2 2) (min-mean-max '(2)))
    (assert-equal '(1 2 3) (min-mean-max '(1 2 3)))
    (assert-equal '(2 6 10) (min-mean-max '(2 4 6 8 10)))
    (assert-equal '(-2 0 2) (min-mean-max '(-2 -1 0 1 2)))
    (assert-equal '(3 3 3) (min-mean-max '(3 3 3 3 3 3 3 3 3)))
    (assert-equal '(8 33/4 9) (min-mean-max '(9 8 8 8 8 8 8 9)))
    (assert-equal '(-4 11/8 5) (min-mean-max '(1 2 5 -4 3 2 1 1)))
    (assert-equal '(-3 0 3) (min-mean-max '(0 0 0 0 0 0 -1 1 -2 2 -3 3)))
    (assert-equal '(1 2 3) (min-mean-max '(1 2 2 3)))
    (assert-equal '(-1 -4/5 0) (min-mean-max '(0 -1 -1 -1 -1)))
)
;;;;;;;;;;;;;;;;;
;;; run tests ;;;
;;;;;;;;;;;;;;;;;

(run-tests :all)
