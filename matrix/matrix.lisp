; You may define helper functions here
(defun add-vector(vec1 vec2 res)(
  if(null vec1)res
  (
    add-vector (cdr vec1) (cdr vec2) (append res (list (+ (car vec1) (car vec2))))
  )
))

(defun matrix-add-helper(mat1 mat2 res)(
  if(null mat1)res
  (
    matrix-add-helper (cdr mat1) (cdr mat2) (append res (list (add-vector (car mat1) (car mat2) ())))
  )
))

(defun matrix-add (mat1 mat2)
  (matrix-add-helper mat1 mat2 ())
)

(defun my_length (l)
    (if (null l) 0
        (+ 1 (my_length (cdr l)))))

(defun n-times-cdr(n vector)(
    if(eql n 0)(car vector)
    (n-times-cdr (- n 1) (cdr vector))
)
)
(defun matrix-transpose-helper(m len mat mat2 vector res)
(
    
        if (eql len m)res
        (
            if(null mat2)
            (
                matrix-transpose-helper m (+ 1 len) mat mat () (append res (list vector))
            )
            (
                matrix-transpose-helper m len mat (cdr mat2) (append vector (list (n-times-cdr len (car mat2)))) res
            )
        )
    
)
)
(defun matrix-transpose (mat)
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  (let*((m (my_length (car mat))))
  (
    matrix-transpose-helper m 0 mat mat () ()
  )
  )
)

(defun multiply-vector(vec1 vec2 res)(
  if(null vec1)res
  (
    multiply-vector (cdr vec1) (cdr vec2) (+ res (* (car vec1) (car vec2)))
  )
))

(defun matrix-multiply-helper (mat1 ori_mat2 mat2 vector res)(
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  if(null mat1)res
  (if(null mat2)(matrix-multiply-helper (cdr mat1) ori_mat2 ori_mat2 () (append res (list vector)))
  (
    matrix-multiply-helper mat1 ori_mat2 (cdr mat2) (append vector (list (multiply-vector (car mat1) (car mat2) 0))) res
  ))
)
)

(defun matrix-multiply (mat1 mat2)
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  (let((mat2 (matrix-transpose mat2)))(
    matrix-multiply-helper mat1 mat2 mat2 () ()
  ))
)

