; You may define helper functions here

(defun my_length (l)
    (if (null l) 0
        (+ 1 (my_length (cdr l)))))

(defun find_min(x min)
    (cond ((null x) min)
          ((> min (car x)) (find_min (cdr x) (car x)))
          ((find_min (cdr x) min))
    )
)

(defun find_max(x max)
    (cond ((null x) max)
          ((< max (car x)) (find_max (cdr x) (car x)))
          ((find_max (cdr x) max))
    )
)

(defun find_sum(x sum)
    (cond ((null x) sum)
          
          ((find_sum (cdr x) (+ sum (car x))))
    )
)

(defun min-mean-max (xs)
    ;; TODO: Incomplete function
    ;; The next line should not be in your solution.
    (list (find_min (cdr xs) (car xs)) (/ (find_sum (cdr xs) (car xs)) (my_length xs)) (find_max (cdr xs) (car xs)))
)