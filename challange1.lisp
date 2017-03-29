(defun make-best-change (money  &optional (coins '(25 10 5 1)))
  (let ((l coins))
    (values-list (reverse (car (make-best-change-helper money l))))))

(defun make-best-change-helper (money l &optional (result nil) (best nil))
  (do ((lst (get-coin-group money l) (cdr lst))
       (best-lst best 
                 (make-best-change-helper (- money (* (car l) (car lst)))
                                          (cdr l)
                                          (cons (car lst) result)
                                          best-lst)))
      ((null lst) (get-best money best-lst result))))


(defun get-coin-group (money l)
  (cond ((null l) nil)
        ((null (cdr l)) (list (floor money (car l))))
        (t (get-coin-list money l))))

(defun get-coin-list (money l)
  (let* ((temp (+ 1 (floor money (car l))))
         (tmp temp))
    (mapcar #'(lambda (x) (decf tmp)) (make-list temp))))
       
(defun get-best (money best result)
  (if (or (null best)
          (< money (cdr best))
          (and (= money (cdr best))
               (< (reduce #'+ result)
                  (reduce #'+ (car best)))))
      (cons result money)
    best))


;--

(defun make-best-change-helper (money l &optional (result nil) (best nil))
  (do ((lst (get-coin-group money l) (cdr lst))
       (best-lst best 
                 (make-best-change-helper (- money (* (car l) (car lst)))
                                          (cdr l)
                                          (cons (car lst) result)
                                          best-lst)))
      ((null lst) (if (or (null best-lst) (< money (cdr best-lst))
                          (and (= money (cdr best-lst)) (< (reduce #'+ result) (reduce #'+ (car best-lst)))))
                      (cons result money) best-lst))))



;--all-new---


(defun make-best-change (num &optional (coins '(25 10 5 1)))
  (values-list (reverse (car (make-change num coins nil nil)))))

;calculate all possible changes
(defun make-change (num coins current best)
  (do ((choices (get-choices num coins) (cdr choices))
       (temp-best best (make-change (- num (* (car choices) (car coins)))
                                    (cdr coins)
                                    (cons (car choices) current)
                                    temp-best)))
      ((null choices) (update-best num current temp-best))))

;get choices for each coin.
(defun get-choices (num coins)
  (cond ((null coins) nil)
        ((null (cdr coins)) (list (floor num (car coins))))
        (t (loop for i from (floor num (car coins)) downto 0 collect i))))

;update best choices.
(defun update-best (num current best)
  (cond ((or (null best)
             (< num (cdr best))
             (and (= num (cdr best))
                  (< (reduce #'+ current) (reduce #'+ (car best)))))
         (cons current num))
        (t best)))