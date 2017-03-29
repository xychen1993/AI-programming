(defun has-number-p (list) 
	(if (some #'numberp list) 'true 'false)
	)