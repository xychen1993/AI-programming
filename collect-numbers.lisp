(defun collect-numbers (x)
  (cond ((numberp x) (list x))
        ((listp x) (mapcan 'collect-numbers x))
        ))