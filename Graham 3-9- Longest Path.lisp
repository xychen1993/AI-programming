(defun longest-path (start end web)
  (or (reverse (dfs end (list start) web nil))
      (and (eql start end) (list start))))
  
(defun dfs (goal path web longest)
  (if (and (eql goal (car path))
           (consp (cdr path)))
      path
    (let ((neighbors (cdr (assoc (car path) web))))
      (do ((temp neighbors (cdr temp))
           (longest nil (new-path path temp goal longest web)))
          ((null temp) longest)))))

(defun longer (goal head path web longest)  
  (if (> (length p1) (length p2)) p1 p2))

(defun new-path (path temp goal longest web)
  (let ((head (car temp)))
    (cond ((eql head goal) (cons head path))
          ((null (member head path)) (longer (dfs goal (cons head path) web longest) longest))
          (t longest))))

;---
(defun longer (p1 p2) 
  (if (> (length p1) (length p2)) p1 p2))

(defun new-path (path temp goal longest web)
  (let ((head (car temp)))
    (cond ((or (eql head goal) (null (member head path))) (longer (dfs goal (cons head path) web longest) longest))
          (t longest))))

 ((eql head goal) longest)

(or (null temp) (eql (car temp) goal))

(if (or (null (member (car temp) path)) (eql (car temp) goal))
                                 (find-longer (dfs goal (cons (car temp) path) web longest) longest)
                               longest)

