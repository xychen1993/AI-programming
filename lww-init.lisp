(in-package :cl-user)

;;; Suggested start up file for EECS 325
;;; Platform: LispWorks on Windows and MacOS

#-quicklisp
(eval-when (:compile-toplevel :load-toplevel :execute)
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

;;; Set the depth of trace output to a large but finite level.
(setq hcl:*trace-print-level* 10)

;;; Tell the editor to not create backup~ files
(setf (editor:variable-value 'editor::backups-wanted) nil)

;;; Switches the default directory to the one containing this file
(hcl:change-directory
 (make-pathname :directory (pathname-directory *load-truename*)))

;;; add ASD to list of source Lisp files
(editor:define-file-type-hook 
	("lispworks" "lisp" "slisp" "l" "lsp" "mcl" "cl" "asd")
	(buffer type)
	(declare (ignore type))
	(setf (editor:buffer-major-mode buffer) "Lisp"))

;;; Load cs325.lisp to create the cs325 package.

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload "cs325"))