(defun map-file (function pathname)
  (with-open-file (stream pathname :direction : input)
    (map-stream function stream)))

(defun map-stream (function stream)
  (let ((end (gensym)))
    (do ((el (read stream nil end) (read stream nil end))
         (x nil (funcall function el)))
        ((eql el end) nil))))