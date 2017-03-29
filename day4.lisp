
CL-USER 1 > (defparameter *triples* ())
*TRIPLES*

CL-USER 2 > 
(defun add-isa (obj isa)
  (setq *triples*
        (append *triples*
                (list (list obj 'is-a isa)))))
ADD-ISA

CL-USER 3 > 
(defun get-value (obj prop)
  (or (some (lambda
             (triple)
             (get-triple-value obj prop triple))
            *triples*)
      (some (lambda (x) (get-value x prop))
            (get-isas obj))))
GET-VALUE

CL-USER 4 > 
(defun get-triple-value (obj prop triple)
  (and (eql obj (car triple))
       (eql prop (cadr triple)) (caddr triple)))
GET-TRIPLE-VALUE

CL-USER 5 > 
(defun get-isas (obj)
  (filter (lambda
           (triple)
           (get-triple-value obj 'is-a triple))
          *triples*))
GET-ISAS

CL-USER 6 > 
(defun filter (fn lst)
  (mapcan (lambda
           (x)
           (let
            ((v (funcall fn x)))
            (and v (list v))))
          lst))
FILTER

CL-USER 7 > 
(defun init-test ()
  (setq *triples*
        '((bird is-a animal)
          (penguin is-a bird)
          (volatis is-a penguin)
          (animal locomotion walk)
          (bird locomotion fly)
          (penguin locomotion walk)
          (bird volatis fly))))
INIT-TEST

CL-USER 8 > 