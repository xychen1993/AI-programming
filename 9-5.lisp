(defun solve (f min max epsilon)
  (let ((mid (/ (+ min max) 2))
        (fmin (funcall f min))
        (fmax (funcall f max))
        (fmid (funcall f (/ (+ min max) 2))))
    (cond
     ((= fmin 0) min)
     ((= fmax 0) max)
     ((= 0 fmid) mid)
     ((or (= 0 fmid) (< (- max min) epsilon)) mid)
     ((opposite fmin fmid) (solve f mid max epsilon))
     ((opposite fmax fmid) (solve f min mid epsilon))
     (t nil))))
#|
----------------------------------------------------------------------
Definition is a little too long! A "little" is probably OK,
"somewhat" might be OK, if this is a really complicated problem, but
code that is "too long" or "way too long" can almost certainly be
improved.
----------------------------------------------------------------------

Definition is too long but I think they are necessary, if don't do so we need to call the f function everytime to get the fvalues.
And it can also make sentences shorter.

|#

(defun opposite (x y)
  (< 0 (* x y)))
;----
(defun solve (f min max epsilon)
  (do ((x min (+ x epsilon))
       (p-fx (funcall f x) (funcall f x))
       (ans x x))
      ((> x (+ max epsilon)) ans)
))
  )
;---
(defun solve (f min max epsilon)
  (let ((mid (/ (+ min max) 2)))
    (let ((res-min (funcall f min))
          (res-max (funcall f max))
          (res-mid (funcall f mid)))
      (cond ((< (- max min) epsilon) mid)
            ((= res-mid 0) mid)
            ((< 0 (* res-min res-mid)) (solve f mid max epsilon))
            ((< 0 (* res-max res-mid)) (solve f min mid epsilon))
            (t nil)))))
;----

(defun solve (f min max epsilon)
  (let ((fmin (funcall f min))
         (fmax (funcall f max)))
    (cond ((= fmin 0) min)
          ((= fmax 0) max)
          ((< 0 (* fmin fmax)) nil)
          ((> 0 fmin) (helper f min max epsilon))
          (t (helper f max min epsilon)))))

(defun helper (f min max epsilon)
  (let ((mid (/ (+ min max) 2))
        (fmid (funcall f (/ (+ min max) 2))))
    (cond ((= fmid 0) mid)
          ((< (abs (- max min)) epsilon) mid)
          ((> 0 fmid) (helper f mid max epsilon))
          (t (helper f min mid epsilon)))))
