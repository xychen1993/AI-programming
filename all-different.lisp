;---
(defparameter *all-different-kb*
  '(
    (-> (all-different (cons ?l3 (cons ?l2 ?l1)))
        (all-different (cons ?l2 ?l1))
        (all-different (cons ?l3 ?l1))
        (different ?l3 ?l2))
    (-> (different ?x ?y) (different ?y ?x))
    ))
;----
(defparameter *all-different-kb*
  '(
    (-> (all-different (cons ?x (cons ?y ?z)))
        (all-different (cons ?y ?z))
        (all-different (cons ?x ?z))
        (different ?x ?y))
    (-> (different ?x ?y) (different ?y ?x))
    ))