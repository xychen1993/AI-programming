(defparameter *member-kb* 
  '(
    (member ?x (cons ?x ?w))
    (<- (member ?x (cons ?z ?y))
        (member ?x ?y))
    ))

;---
(defparameter *member-kb* 
  '(
    (member ?x (cons ?x ?y))
    (<- (member ?x (cons ?z ?q))
        (member ?x ?q))
    ))