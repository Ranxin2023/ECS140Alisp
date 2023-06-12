; You may define helper functions here
(defun pivot_helper (n xs list1 list2)
    (cond ((null xs) (list list1 list2))
        ((< (car xs) n) (pivot_helper n (cdr xs) (append list1 (list (car xs))) list2 ) )
        ((pivot_helper n (cdr xs) list1 (append list2 (list (car xs)))))
    )

)
(defun pivot (n xs)
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  (pivot_helper n xs () ())
)

(defun quicksort (xs)
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  ;;(list 'incomplete)
  (
    cond 
    ((null xs) ())
    ((null (cdr xs)) xs)
    (
        (let* (
            (pivot_res (pivot (car xs) (cdr xs)))
            (front (car pivot_res))
            (back (car (cdr pivot_res)))
            )
            (append (quicksort front) (list (car xs)) (quicksort back)
            )
      )
    )
)
)