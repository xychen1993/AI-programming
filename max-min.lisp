(defun max-min (v &key (start 0) (end (length v)))
  (cond
   ((= start end) (values nil nil))
   (t (find-max-min v start end (svref v start) (svref v (1- end))))))

(defun find-max-min (v start end min max)
  (if (= start end) (values max min)
    (let ((x (svref v start)))
      (find-max-min v (1+ start) end (min x min) (max x max)))))

