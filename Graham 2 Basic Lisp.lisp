(defun greater (x y)
  (if (> x y) 
      x y))

(defun has-list-p (obj)
  (some 'listp obj))

;;repetition
(defun print-dots (val) 
  (dotimes (n val) 
    (format t ".")))

;;recursion
(defun print-dots (val)
  (when (> val 0) 
    (format t ".")
    (print-dots (1- val))))

;;repetition
(defun get-a-count (obj)
  (do ((l obj (cdr l))
       (count 0 (if (eql (car l) 'a) (1+ count) count)))
      ((null l) count)))


;;recursion
(defun get-a-count (obj)
  (cond 
   (obj (+ (if (eql (car obj) 'a) 1 0) 
           (get-a-count (cdr obj))))
   (t 0)))

;; didn't assign lst as (remove nil lst)
(defun summit (lst)
  (apply #'+ (remove nil lst)))

;;didn't return 0 when lst = none (terminate condition)
(defun summit (lst)
  (if lst
      (let ((x (car lst)))
        (if (null x)
            (summit (cdr lst))
          (+ x (summit (cdr lst)))))
    0))