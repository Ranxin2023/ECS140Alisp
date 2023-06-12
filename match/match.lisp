; You may define helper functions here

(defun match (pattern assertion)
  ;; TODO: incomplete function. 
  ;; The next line should not be in your solution.
  (cond 
    ((null pattern)
        (
            if (null assertion) T
            NIL
        )
    )
    (
        (eql (car pattern) '?)
        (
            if (null assertion)NIL
            (match (cdr pattern) (cdr assertion))
        )
    )
    (
        (eql (car pattern) '!)
        (
            if (null assertion)NIL
            (if(match (cdr pattern) (cdr assertion))T
                (match pattern (cdr assertion))
            )
        )
    )
    (
        (if(null assertion)NIL
        (
            if(eql (car pattern) (car assertion))(match (cdr pattern) (cdr assertion))
            NIL
        )
        )
    )
  )
)
