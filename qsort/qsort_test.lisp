;;;;;;;;;;;;;;;;;;;;;;;;
;;; pre-testing prep ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

(load "../lisp-unit.lisp")

(use-package :lisp-unit)

(load "qsort.lisp")

(remove-tests :all)

(setq *print-failures* t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pivot test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-pivot
    (assert-equal '(NIL NIL) (pivot 1 'NIL))
    (assert-equal '(NIL (2)) (pivot 1 '(2)))
    (assert-equal '(NIL (1)) (pivot 1 '(1)))
    (assert-equal '((1 2 3 4) NIL) (pivot 10 '( 1 2 3 4)))
    (assert-equal '((1 2 3) (6 7 8)) (pivot 5 '(1 2 3 6 7 8)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; quicksort test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-quicksort
    (assert-equal 'NIL (quicksort 'NIL)
    (assert-equal '(1) (quicksort '(1))))   
    (assert-equal '(1 1 1 1) (quicksort '(1 1 1 1)))
    (assert-equal '(1 2 3 4) (quicksort '(4 3 2 1)))
    (assert-equal '(1 2 3 4 5 6) (quicksort '(1 2 3 4 5 6)))
    (assert-equal '(1 2 3 4 5 6 7) (quicksort '(5 4 3 7 2 6 1)))
)

;;;;;;;;;;;;;;;;;
;;; run tests ;;;
;;;;;;;;;;;;;;;;;

(run-tests :all)
