(defclass tokenizer ()
  ((tokens :initform nil
           :accessor tkns)))

(defun split (str delim)
  (do* ((start 0 (1+ end))
        (end (position delim str) (position delim str :start start))
        (r (get-result str delim start end) (get-result str delim start end))
        (result r (if r (cons (car r) result) result)))
       ((null end) (reverse result))))

(defun get-result (str delim start end)
  (unless (not (and (eql delim #\space) (or (eql start end) (null end))))
    (list (subseq str start end))))

(defun make (str delim)
  (let ((tr (make-instance 'tokenizer)))
    (setf (slot-value tr 'tokens) (split str delim))
    tr))

(defun split-string (str &optional (delim #\space))
  (let ((tknzr (make str delim)))
    (do ((tknzr tknzr (cdr (slot-value tknzr 'tokens)))
         (l nil (cons (car (slot-value tknzr 'tokens)) l)))
        ((null (slot-value tknzr 'tokens)) (nreverse l)))))

(defmethod next-token-p ((tokenizer tokenizer))
  (when (slot-value tokenizer 'tokens) t))

(defmethod next-token ((tokenizer tokenizer))
  (let ((s (slot-value tokenizer 'tokens)))
    (setf (slot-value tokenizer 'tokens) (cdr s))
    (car s)))



;---
(defun split-string (str &optional (delim #\space))
  (let ((tknzr (make-tokenizer str delim)))
    (do ((l nil (cons (next-token tknzr) l)))
        ((not (next-token-p tknzr)) (nreverse l)))))
;edition my
(defun split-string (str &optional (delim #\space))
  (let ((tknzr (make-tokenizer str delim)))
    (do ((l nil (cons (next-token tknzr) l)))
        ((null (slot-value tknzr 'tokens)) (nreverse l)))))


(defmethod next-token-p ((tokenizer tokenizer))
  (not (null (slot-value tokenizer 'tokens))))

(defmethod next-token ((tokenizer tokenizer))
  (let ((slot (slot-value tokenizer 'tokens)))
    (setf (slot-value tokenizer 'tokens) (cdr slot))
    (car slot)))

(defun split-on-delim (str delim)
  (do* ((start 0 (1+ end))
        (end (position delim str) (position delim str :start start))
        (result (if (and (eql delim #\space) (eql start end))
                    nil
                  (list (subseq str start end)))
                (if (and (eql delim #\space) (or (eql start end) (null end)))
                    result
                  (cons (subseq str start end) result))))
       ((null end) (reverse result))))


