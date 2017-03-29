(defparameter *planning-kb*
  '((plan-for ?goal ?goal nil)
    (<- (plan-for ?state-1 ?goal (cons ?action ?actions))
        (action-for ?state-1 ?goal ?action)
        (result ?state-1 ?state-2 ?action)
        (plan-for ?state-2 ?goal ?actions))))

(defparameter *rooms-kb*
  '( 
    (-> (different ?x ?y) (different ?y ?x))
    (different room1 room2)
    (different room1 room3)
    (different room2 room3)
    (different room1 hall)
    (different room2 hall)
    (different room3 hall)
   ))

(defparameter *shakey-1-kb*
  '((result (v1-state ?b1 ?b1)
            (v1-state ?b2 ?b2)
            (push-box ?b1 ?b2))
    (result (v1-state ?r1 ?b)
            (v1-state ?r2 ?b)
            (move-to ?r2))
    (<- (action-for (v1-state hall ?b)
                    (v1-state ?1 ?goal)
                    (move-to ?b))
        (different hall ?b)
        (different ?r hall)
        (different ?b ?goal))
    (<- (action-for (v1-state ?r ?b)
                    (v1-state ?1 ?goal)
                    (move-to hall))
        (different ?r ?b)
        (different ?r hall)
        (different ?b ?goal))
    (<- (action-for (v1-state ?b ?b)
                    (v1-state ?1 ?goal)
                    (push-box ?b hall))
        (different ?b hall)
        (different ?goal ?b))
    (<- (action-for (v1-state hall hall)
                    (v1-state ?1 ?goal)
                    (push-box hall ?goal)))))


(defparameter *shakey-1-kb* (append *planning-kb* *shakey-kb* *rooms-kb*))





;-----not-----
(defparameter *general-kb*
  '(
    (plan-for ?goal ?goal nil)
    (<- (plan-for ?state-1 ?goal (cons ?action ?actions))
        (action-for ?state-1 ?goal ?action)
        (results ?state-1 ?state-2  ?action)
        (plan-for ?state-2  ?goal ?actions))
    ))

(defparameter *rules-kb*
  '((results (v1-state ?b1 ?b1)
             (v1-state ?b2 ?b2)
             (push-box ?b1 ?b2))
    (results (v1-state ?r1 ?b)
             (v1-state ?r2 ?b)
             (move-to ?r2))
    (<- (action-for (v1-state ?r ?b)
                    (v1-state ?1 ?goal)
                    (move-to hall))
        (different ?r hall)
        (different ?r ?b)
        (different ?b ?goal))
    (<- (action-for (v1-state hall ?b)
                    (v1-state ?1 ?goal)
                    (move-to ?b))
        (different hall ?b)
        (different ?b ?goal))
    
    (<- (action-for (v1-state hall hall)
                    (v1-state ?1 ?goal)
                    (push-box hall ?goal)))
    (<- (action-for (v1-state ?b ?b)
                    (v1-state ?1 ?goal)
                    (push-box ?b hall))
        (different ?b hall)
        (different ?goal ?b))
    ))

(defparameter *room-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (different room1 room2)
    (different room1 room3)
    (different room1 hall)
    (different room2 hall)
    (different room3 hall)))

(defparameter *shakey-1-kb* (append *general-kb* *rules-kb* *room-kb*))


(defparameter *room-kb*
  '( 
    (-> (different ?x ?y) (different ?y ?x))
    (-> (connect ?x ?y) (connect ?y ?x))
    (different room1 room2)
    (different room1 room3)
    (different room2 room3)
    (different room1 hall)
    (different room2 hall)
    (different room3 hall)
    (connect room1 hall)
    (connect room2 hall)
    (connect room3 hall)
   ))

