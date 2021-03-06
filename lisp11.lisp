(defun find-range (function start end)
  (do ((i (if (> start end) -1 1))
       (n start (+ n i)))
      ((or (= n end) (funcall function n))
       (if (= n end) nil n))))

(defun map-range (function start end)
  (do ((i (if (> start end) -1 1))
       (n start (+ i n))
       (l nil (cons (funcall function n) l)))
      ((= n end) (reverse l))))

(defun every-range (function start end)
  (do ((i (if (> start end) -1 1))
       (n start (+ n i)))
      ((or (= n end) (not (funcall function n)))
       (= n end))))