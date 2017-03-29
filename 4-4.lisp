(defun bst-elements (tree)
  (let ((list nil))
    (bst-traverse (lambda (node) 
                    (push node list)) 
                  tree)
    list))
;;----
(defun bst-elements (bst)
  (if (NULL bst)
      nil
      (append (bst-elements (node-r bst))
              (cons (node-elt bst)
                    (bst-elements (node-l bst))))
    ))

;;-----
(defun bst-elements (tree)
  (if tree
      (append (bst-elements (node-r tree))
              (list (node-elt tree))
              (bst-elements (node-l tree)))
    nil))
  
(defun bst-elements (tree)
  (let ((tree-els nil))
    (bst-traverse (lambda (element)
                    (push element tree-els))
                  tree)
    tree-els))