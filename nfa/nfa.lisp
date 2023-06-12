; You may define helper functions here
(defun my_length (l)
    (if (null l) 0
        (+ 1 (my_length (cdr l)))))

(defun reachable (transition start final input)
    ;; TODO: Incomplete function
    ;; The next line should not be in your solution.
    (   
        if(null input)(
            if(eql start final)T
            NIL
        )
        
            (
                let*(
                    (next_state (funcall transition start (car input)))
                    (next_state_length (my_length next_state))
                    )
                    (
                        cond 
                        (
                            (eql next_state_length 0)
                            (NIL)
                        )
                        (
                            (eql next_state_length 2)
                            (
                                
                                or (reachable transition (car next_state) final (cdr input)) (reachable transition (car (cdr next_state)) final (cdr input))
                            )
                        )
                        (
                            (eql next_state_length 1)
                            (
                                reachable transition (car next_state) final (cdr input)
                            )
                        )            
                    )
            )
        
    )
)