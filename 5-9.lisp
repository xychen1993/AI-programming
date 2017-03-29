(defun shortest-path (start end net)
  (catch 'done 
    (bfs end (list (list start)) net)))

(defun bfs (end queue net)
  (if (empty-queue-p queue)
      nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (bfs end (append (cdr queue)
                         (new-paths path node net end))
             net)))))

(defun new-paths (path node net end)
  (when (member end (assoc node net))
    (throw 'done (reverse (cons end path))))  
  (mapcan #'(lambda (n)
              (if (member n path) nil
                (list (cons n path))))           
          (cdr (assoc node net))))
