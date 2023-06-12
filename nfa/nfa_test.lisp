;;;;;;;;;;;;;;;;;;;;;;;;
;;; pre-testing prep ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

(load "../lisp-unit.lisp")

(use-package :lisp-unit)

(load "nfa.lisp")

(remove-tests :all)

(setq *print-failures* t)

(defun fooTransitions (state input)
    ;;  * 0 -a-> 1
	;;  * 0 -a-> 2
	;;  * 1 -b-> 3
	;;  * 2 -c-> 3

    (cond
    ((and (eq state 0) (eq input 'A ))  (list 1 2))
    ((and (eq state 0) (eq input 'B ))  (list 2))
    ((and (eq state 1) (eq input 'B ))  (list 3))
    ((and (eq state 2) (eq input 'c ))  (list 3))
    (t (list nil))
    )
)

(defun expTransitions (state input)
	;;  * 0 -a-> 1
	;;  * 0 -a-> 2
	;;  * 0 -b-> 2
	;;  * 1 -b->0
    (cond
    ((and (eq state 0) (eq input 'A ))  (list 1 2))
    ((and (eq state 0) (eq input 'B ))  (list 2))
    ((and (eq state 1) (eq input 'B ))  (list 0))
    (t (list nil))
    )
)

(defun langTransitions (state input)
	;;  * 0 -a-> 0
	;;  * 0 -b-> 1
	;;  * 1 -a-> 1
	;;  * 1 -b-> 0
  (cond
    ((and (eq state 0) (eq input 'A ))  (list 0))
    ((and (eq state 0) (eq input 'B ))  (list 1))
    ((and (eq state 1) (eq input 'A ))  (list 1))
    ((and (eq state 1) (eq input 'B ))  (list 0))
    (t (list nil))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; reachable test definitions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test test-reachable
    (assert-equal T (reachable 'fooTransitions 0 0 NIL))
    (assert-equal NIL (reachable 'fooTransitions 0 3 '(A B C)))
    (assert-equal T (reachable 'fooTransitions 0 3 '(A B)))
    (assert-equal NIL (reachable 'fooTransitions 0 3 '(A A A)))
    (assert-equal T (reachable 'fooTransitions 0 3 '(A C)))

    (assert-equal T (reachable 'expTransitions 0 0 NIL))
    (assert-equal NIL (reachable 'expTransitions 0 2 '(B B)))
    (assert-equal T (reachable 'expTransitions 0 1 '(A B A)))
    (assert-equal NIL (reachable 'expTransitions 0 2 '(A B)))
    (assert-equal T (reachable 'expTransitions 0 2 '(A B A)))

    (assert-equal T (reachable 'langTransitions 0 0 NIL))
    (assert-equal T (reachable 'langTransitions 0 1 '(B)))
    (assert-equal T (reachable 'langTransitions 0 0 '(A A A)))
    (assert-equal NIL (reachable 'langTransitions 0 1 '(A B B A)))
    (assert-equal T (reachable 'langTransitions 0 1 '(B A B A B)))
)
;;;;;;;;;;;;;;;;;
;;; run tests ;;;
;;;;;;;;;;;;;;;;;

(run-tests :all)
