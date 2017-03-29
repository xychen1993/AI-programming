;;; Bug Finder Test Cases for Graham Exercises
;;;
;;; Test cases for Graham, Lisp, and project exercises.
;;; Most but not all assigned exercises have test cases.

;;; Update history:
;;;
;;; MERGE laptop and online tests
;;; ADD test for no delim given to tokenizer

;;; 12-10-2015 added off-segment test to INTERECT-SEGMENTS [CKR]
;;; 12-04-2015 tests for 11.2 added [CKR]
;;; 11-25-2015 change NTH-EXPR COMPILE to COERCE to avoid Lispworks error [CKR]
;;; 11-20-2015 added tests to SOLVE [CKR]
;;; 11-28-2014 fixed missing segment-equality in INTERSECT-SEGMENTS [CKR]
;;; 11-21-2014 added compilation tests to NTH-EXPR and N-OF [CKR]
;;; 11-19-2014 changed MAP-STREAM test to catch compiled code [CKR]
;;; 11-03-2014 updated HENLEY-P for current Gutenberg version [CKR]
;;; 10-30-2014 added Liang's test to SHORTEST-PATH [CKR]
;;; 10-26-2014 added another test to LONGEST-PATH [CKR]
;;; 10-24-2014 added another test to SHOW-LIST [CKR]
;;; 10-15-2014 changed RANGE tests to allow for downward ranges [CKR]
;;; 10-14-2014 added tests for WITH-COLLECTOR, TOKENIZER, and RANGE functions [CKR]
;;; 10-13-2014 added another test to SHOW-LIST [CKR]
;;; 10-09-2014 unquote predicates in ASSERT-EQUALITY calls [CKR]
;;; 12-11-2013 added a test case to INTERSECT-SEGMENTS [CKR]
;;; 11-16-2013 revamped MEMOIZE to be simpler and smarter [CKR]
;;; 11-06-2013 revamped final MAP-STREAM EOF test [CKR]
;;; 10-30-2013 added test to HAS-NUMBER-P [CKR]
;;; 10-26-2013 added a linebreak in MAP-STREAM [CKR]
;;; 10-14-2013 changed DELETE-CAR tests to display L on failure [CKR] 
;;; 10-13-2013 added dotted-pair test to DELETE-CAR [CKR]
;;; 11-06-2012 added Dhrumil Mehta's test to STABLE-SET-DIFFERENCE [CKR]
;;; 12-01-2011 added test to LIST-OF for generator first [CKR]
;;; 11-10-2011 simplified and improved HENLEY-P tests [CKR]
;;; 11-09-2011 added a test to LONGEST-PATH [CKR]
;;; 11-02-2011 changed MEMOIZE to have clearer labels [CKR]
;;; 10-24-2011 added a test to MAX-MIN [CKR]
;;; 06-28-2011 renamed variable to avoid conflict with NET-ASERVE:START [CKR]
;;; 11-18-2010 added a TCONC-LIST test to TCONC [CKR]
;;; 11-18-2010 changed RING-PACKAGE to be used with RING.LISP and FILE.LISP [CKR]
;;; 11-18-2010 made RING-PACKAGE test more thorough [CKR]
;;; 11-15-2010 fixed missing package handling in RING-PACKAGE [CKR]
;;; 11-14-2010 changed RING-PACKAGE testing approach [CKR]
;;; 11-10-2010 added a test to MAP-STREAM
;;; 11-08-2010 added code to clear *PRINT-LENGTH* and *PRINT-LEVEL* in MAP-STREAM [CKR]
;;; 11-07-2010 changed MEMOIZE test to not use IDENTITY internally [CKR]
;;; 11-04-2010 added test to LONGEST-PATH [CKR]
;;; 10-07-2010 added tests for HENLEY-P [CKR]
;;; 10-05-2010 changed SHORTEST-PATH to catch queue bugs [CKR]
;;; 10-04-2010 changed PRECEDERS to use UNORDERED-EQUAL [CKR]
;;; 12-04-2009 restored MAP-STREAM test fix for Lispworks [CKR]
;;; 12-02-2009 fixed duplicate #13# in CIRCULAR-MEMBER-P [CKR]
;;; 12-01-2009 added more tests to CIRCULAR-MEMBER-P [CKR]
;;; 09-23-2009 removed unnecessary USE-PACKAGE calls [CKR]
;;; 12-02-2008 added a test to ENQUEUE-FRONT [CKR]
;;; 11-30-2008 added a test from Samuel Wilson to MAKE-BEST-CHANGE [CKR]
;;; 11-05-2008 added test to MAP-STREAM [CKR]
;;; 11-01-2008 added test to MAX-MIN [CKR]
;;; 04-15-2008 add a two-paths test to CAR-CIRCULAR-P [CKR]
;;; 04-15-2008 corrected a bad test in CAR-CIRCULAR-P reported by Paul D Reiners [CKR]
;;; 03-14-2008 added test to REQUEUE-FRONT [CKR]
;;; 03-12-2008 added test to COPY-QUEUE [CKR]
;;; 03-09-2008 added test from Ryan Cortez to MAKE-BEST-CHANGE [CKR]
;;; 03-01-2008 added test from Matthe Reuter to LIST-OF [CKR]
;;; 02-15-2008 added a test to COPY-QUEUE [CKR]
;;; 02-05-2008 added a test to CIRCULAR-MEMBER-P from Matthew Reuter [CKR]
;;; 02-05-2008 added non-string pattern tests for STREAM-SUBST [CKR]
;;; 02-04-2008 added a test to REQUEUE-FRONT [CKR]
;;; 02-01-2008 added a test for MAKE-BALANCE, suggested by Michael Clark [CKR]
;;; 01-21-2008 added tests for SHORTEST-PATH (Ex 5.9) [CKR]
;;; 01-17-2008 added tests to DELETE-CAR [CKR]
;;; 01-12-2008 added test case to stable set functions [CKR]
;;; 07-02-2007 added expected error test to NTH-EXPR [CKR]
;;; 03-14-2007 improved test for BIGGER-ARG [CKR]
;;; 03-05-2007 added test to HAS-NUMBER-P [CKR]
;;; 02-26-2007 added DOUBLEF tests [CKR]
;;; 02-19-2007 removed some tests with multiple solutions from MAKE-BEST-CHANGE [CKR]
;;; 02-18-2007 added 3 dimes test to MAKE-BEST-CHANGE [CKR]
;;; 02-10-2007 simplified and expanded tests for MEMOIZE [CKR]
;;; 03-15-2006 replaced FRUGAL with MEMOIZE [CKR]
;;; 02-24-2006 added Forrest Sondahl's tests for CAR-CIRCULAR-P [CKR]
;;; 02-20-2006 fixed duplicate :ELSE in KEY-IF test [CKR]
;;; 02-14-2006 changed the last MAP-STREAM test output to be more readable [CKR]
;;; 02-11-2006 removed duplicate sublist labels in CIRCULAR-MEMBER-P [CKR]
;;; 02-10-2006 added a new test for KEY-IF [CKR]
;;; 02-10-2006 added William Siegrist's CIRCULAR-MEMBER-P tests [CKR]
;;; 02-10-2006 modified SOLVE tests [CKR]
;;; 02-09-2006 added John Otto's tests for HAS-NUMBER-P [CKR]
;;; 01-25-2006 added William Siegrist's <prevent> test to EXTRACT-CODE-FROM-STRING [CKR]
;;; 12-30-2005 updated tests to use ASSERT-EQUALITY etc when appropriate [CKR]
;;; 03-04-2005 fixed newlines in strings in Ex 7.3 tests [CKR]
;;; 03-04-2005 addes tests for ch 7 [CKR]
;;; 03-04-2005 fixed bad tests for Ex 9.4 [CKR]
;;; 02-17-2005 added MAP-STREAM tests [CKR]
;;; 02-17-2005 added STREAM-SUBST tests [CKR]
;;; 02-09-2005 added test to NTH-EXPR [CKR]
;;; 01-31-2005 added test to STABLE-SET-DIFFERENCE [CKR]
;;; 01-31-2005 fixed backwards BST-ELEMENTS tests [CKR]
;;; 01-27-2005 added non-default coin list tests to MAKE-CHANGE [CKR]
;;; 01-18-2005 updated for new lisp-unit [CKR]
;;; 12-01-2004 added BST-ELEMENTS [CKR]
;;; 11-30-2004 edited to be compatible with the new lisp-unit [CKR]
;;; 03-17-2004 added test to CDR-CIRCULAR-P [CKR]
;;; 03-17-2004 added MAKE-QUEUE and EMPTY-QUEUE-P tests [CKR]
;;; 03-16-2004 added queue tests (ch 12) [CKR]
;;; 03-16-2004 added ABSTS-ABSTP test [CKR]
;;; 03-15-2004 changed FRUGAL to give clearer failure message [CKR]
;;; 03-15-2004 added a test to ?IS-A [CKR]
;;; 03-12-2004 added atom tests to SHOW-LIST [CKR]
;;; 03-08-2004 added some more DELETE-CAR test [CKR]
;;; 03-04-2004 added FRUGAL test [CKR]
;;; 03-03-2004 removed some tests from ABSTS-ABSTP [CKR]
;;; 03-03-2004 added more tests to PRESERVE [CKR]
;;; 03-02-2004 added Wagner's tests for ABSTS-ABSTP [CKR]
;;; 03-02-2004 added PRESERVE test [CKR]
;;; 02-27-2004 added TEST-TAKING-MATCH [CKR]
;;; 02-27-2004 added tests for Ex 8.4 [CKR]
;;; 02-27-2004 added NTH-EXPR and N-OF tests [CKR]
;;; 02-24-2004 added BIN-SEARCH tests [CKR]
;;; 02-16-2004 added ABSTS-ABSTP test [CKR]
;;; 02-13-2004 added empty vector test to PRECEDERS [CKR]
;;; 02-11-2004 added COMMON-ABSTS test [CKR]
;;; 02-10-2004 added non-string example for PRECEDERS [CKR]
;;; 02-09-2004 added FUNCTIONS-REFERENCED test [CKR]
;;; 02-03-2004 added 3TREE test [CKR]
;;; 02-02-2004 added (((A B) C) D) test to SHOW-LIST [CKR]
;;; 01-31-2004 added *PRINT-CIRCLE* to circular list tests [CKR]
;;; 01-31-2004 added EQ test to MY-COPY-LIST [CKR]
;;; 01-29-2004 added Earl Wagner's tests for LIST-OF [CKR]
;;; 01-29-2004 added new STABLE-INTERSECTION case [CKR]


(in-package :cs325-user)

;;; Chapter 2

;;; Ex 2.4

(define-test greater
  (assert-equal 2 (greater 1 2))
  (assert-equal 2 (greater 2 1))
  (assert-equal -1 (greater -5 -1))
  (assert-equal 0 (greater -2 0))
  (assert-equal 3 (greater 3 3))
  )

;;; Ex 2.7

(define-test has-list-p
  (assert-false (has-list-p '(a b c)))
  (assert-true (has-list-p '((a) b)))
  (assert-true (has-list-p '(a b (c))))
  (assert-false (has-list-p 'nil))
  (assert-true (has-list-p '(a nil c)))
  (assert-true (has-list-p '(nil a)))
  (assert-true (has-list-p '(nil)))
  )

;;; Ex 2.8-a

(define-test print-dots
  (assert-prints "...." (print-dots 4))
  (assert-prints "." (print-dots 1))
  (assert-prints "" (print-dots 0))
  )

;;; Ex 2.8-b

(define-test get-a-count
  (assert-equal 3 (get-a-count '(a a a)))
  (assert-equal 0 (get-a-count '(b c d)))
  (assert-equal 0 (get-a-count 'nil))
  (assert-equal 0 (get-a-count '(b (a) d)))
  (assert-equal 2 (get-a-count '(a b a)))
  (assert-equal 2 (get-a-count '(nil a a)))
  )

;;; Ex 2.9

(define-test summit
  (assert-equal 6 (summit '(1 2 3)))
  (assert-equal 4 (summit '(1 nil 3)))
  (assert-equal 0 (summit '(nil nil nil)))
  (assert-equal 0 (summit nil))
  )

;;; Chapter 3

;;; Ex 3.2

(define-test stable-union
  (assert-equal '(a b c d) (stable-union '(a b c) '(b a d)))
  (assert-equal '(a b c d e f) (stable-union '(a b c) '(d e f)))
  (assert-equal '(a b c) (stable-union '(a b c) 'nil))
  (assert-equal '(a b c d e) (stable-union '(a b c) '(a d b e)))
  (assert-equal '(c b a e d) (stable-union '(c b a) '(a e b d)))
  (assert-equal '(a b c) (stable-union 'nil '(a b c)))
  (assert-equal '(a b c d e) (stable-union '(a b c) '(c d e)))
  (assert-equal 'nil (stable-union 'nil 'nil))
  )


(define-test stable-intersection
  (assert-equal '(a b) (stable-intersection '(a b c) '(b a d)))
  (assert-equal '(a b) (stable-intersection '(a b c) '(a b d)))
  (assert-equal '(c) (stable-intersection '(a b c) '(c d e)))
  (assert-equal 'nil (stable-intersection '(a b c) '(d e f)))
  (assert-equal 'nil (stable-intersection '(a b c) 'nil))
  (assert-equal 'nil (stable-intersection 'nil '(a b c)))
  (assert-equal 'nil (stable-intersection 'nil 'nil))
  )

(define-test stable-set-difference
  (assert-equal '(c) (stable-set-difference '(a b c) '(b a d)))
  (assert-equal '(a b c) (stable-set-difference '(a b c) '(d e f)))
  (assert-equal '(a b c) (stable-set-difference '(a b c) 'nil))
  (assert-equal '(c) (stable-set-difference '(a b c) '(a d b e)))
  (assert-equal '(d e) (stable-set-difference '(a d b e) '(a b c)))
  (assert-equal '(a b) (stable-set-difference '(a b c) '(c d e)))
  (assert-equal '(d e) (stable-set-difference '(c d e) '(a b c)))
  (assert-equal 'nil (stable-set-difference 'nil '(a b c)))
  (assert-equal 'nil (stable-set-difference 'nil 'nil))
  )

;;; Ex 3.3

(define-test occurrences
  (assert-equal '((a . 4) (c . 3) (d . 2) (b . 1)) (occurrences '(a b a d a c d c a c)))
  (assert-equal '((nil . 3) (b . 2) (a . 1)) (occurrences '(nil a b nil b nil)))
  (assert-equal 'nil (occurrences 'nil))
  )

;;; Ex 3.5

(define-test position+
  (assert-equal '(7 6 3 7) (position+ '(7 5 1 4)))
  (assert-equal '(7 6 9 8) (position+ '(7 5 7 5)))
  (assert-equal '(7) (position+ '(7)))
  (assert-equal 'nil (position+ 'nil))
  )

;;; Ex 3.8

(define-test show-dots
  (assert-prints "(A . (B . (C . NIL)))" (show-dots '(a b c)))
  (assert-prints "(A . ((B . (C . NIL)) . NIL))" (show-dots '(a (b c))))
  (assert-prints "(A . B)" (show-dots '(a . b)))
  (assert-prints "NIL" (show-dots nil))
  (assert-prints "(NIL . NIL)" (show-dots '(nil)))
  )

(define-test show-list
  (assert-prints "[A B C]" (show-list '(a b c)))
  (assert-prints "[[[A B] C] D]" (show-list '(((a b) c) d)))
  (assert-prints "[A [B C]]" (show-list '(a (b c))))
  (assert-prints "[A . B]" (show-list '(a . b)))
  (assert-prints "[A B C . D]" (show-list '(a b c . d)))
  (assert-prints "A" (show-list 'a))
  (assert-prints "12" (show-list 12))
  (assert-prints "NIL" (show-list nil))
  (assert-prints "[NIL]" (show-list '(nil)))
  (assert-prints "[[[A]]]" (show-list '(((a)))))
  (assert-prints "[[A] . B]" (show-list '((a) . b)))
  )

;;; Ex 3.9

(define-test longest-path
  (assert-equal '(a b c) (longest-path 'a 'c '((a b) (b c))))
  (assert-equal '(a b c) (longest-path 'a 'c '((a b) (b a c))))
  (assert-equal '(a b c) (longest-path 'a 'c '((a d e f g b) (b a c))))
  (assert-equal '(a b a) (longest-path 'a 'a '((a b) (b a c))))
  (assert-equal nil (longest-path 'a 'c '((a b) (b a) (c))))
  (assert-equal '(a c d e f) (longest-path 'a 'f '((a b c) (b f) (c d) (d e) (e f))))
  (assert-equal '(a b c e d f) (longest-path 'a 'f '((a b c a) (b c d) (c e a) (d e f) (e d f))))
  (assert-equal '(a b c a) (longest-path 'a 'a '((a b c a) (b c d) (c e a) (d e f) (e d f))))
  (assert-equal '(a) (longest-path 'a 'a '((a b) (b c))))
  (assert-equal '(a a) (longest-path 'a 'a '((a a b) (b c))))
  (assert-equal '(a a) (longest-path 'a 'a '((a b a) (b c))))
  (assert-equal '(a b) (longest-path 'a 'b '((a b) (b c) (c b))))
  (assert-equal '(a c b) (longest-path 'a 'b '((a b c) (b c) (c b))))
  )

;;; Chapter 4

;;; A utility for copying arrays for the in-place rotate in graham-4-1

(defun copy-array (a)
  (let* ((dims (array-dimensions a))
         (a-copy (make-array dims :element-type (array-element-type a))))
    (dotimes (i (array-total-size a))
       (setf (row-major-aref a-copy i)
             (row-major-aref a i)))
    a-copy))
  
;;; Ex 4.1

(define-test rotate-array
  (assert-equalp #2a((c a) (d b)) (rotate-array #2a((a b) (c d))))
  (assert-equalp #2a((g d a) (h e b) (i f c)) (rotate-array #2a((a b c) (d e f) (g h i))))
  (assert-equalp #2a((a)) (rotate-array #2a((a))))
  (assert-equalp #2a((13 9 5 1) (14 10 6 2) (15 11 7 3) (16 12 8 4))
                 (rotate-array #2a((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16))))
  (assert-equalp #2a((21 16 11 6 1) (22 17 12 7 2) (23 18 13 8 3) (24 19 14 9 4) (25 20 15 10 5))
                 (rotate-array #2a((1 2 3 4 5)
                                   (6 7 8 9 10)
                                   (11 12 13 14 15)
                                   (16 17 18 19 20)
                                   (21 22 23 24 25))))
  (let ((x #2a((a b c) (d e f) (g h i))))
    (assert-false (eq (rotate-array x) x) x))
  )

(define-test nrotate-array
  (assert-equalp #2a((c a) (d b)) (nrotate-array (copy-array #2a((a b) (c d)))))
  (assert-equalp #2a((g d a) (h e b) (i f c))
                 (nrotate-array (copy-array #2a((a b c) (d e f) (g h i)))))
  (assert-equalp #2a((a)) (nrotate-array (copy-array #2a((a)))))
  (assert-equalp #2a((13 9 5 1) (14 10 6 2) (15 11 7 3) (16 12 8 4))
                 (nrotate-array (copy-array #2a((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16)))))
  (assert-equalp #2a((21 16 11 6 1) (22 17 12 7 2) (23 18 13 8 3) (24 19 14 9 4) (25 20 15 10 5))
                 (nrotate-array (copy-array #2a((1 2 3 4 5)
                                                (6 7 8 9 10)
                                                (11 12 13 14 15)
                                                (16 17 18 19 20)
                                                (21 22 23 24 25)))))
  (let ((x #2a((a b c) (d e f) (g h i))))
    (assert-true (eq (nrotate-array x) x) x))
  )

;;; Ex 4.2-a

(define-test my-copy-list
  (assert-equal '(a b c) (my-copy-list '(a b c)))
  (assert-equal '(a b a c b) (my-copy-list '(a b a c b)))
  (assert-equal '(a) (my-copy-list '(a)))
  (assert-equal nil (my-copy-list nil))
  (let ((l '(a b c)))
    (assert-false (eq l (my-copy-list l)) l))
  )

;;; Ex 4.2-b

(define-test my-reverse
  (assert-equal '(c b a) (my-reverse '(a b c)))
  (assert-equal '(b a) (my-reverse '(a b)))
  (assert-equal '(a) (my-reverse '(a)))
  (assert-equal nil (my-reverse nil))
  (assert-equal '(d (b c) a) (my-reverse '(a (b c) d)))
  )


;;; Ex 4.3

;;; Utility for building 3tree from nested list

(defun list->3tree (l)
  (if (null l) nil
    (make-3tree :data (first l)
                :left (list->3tree (second l))
                :middle (list->3tree (third l))
                :right (list->3tree (fourth l)))))


(define-test 3tree-clone
  (let* ((tree (list->3tree '(top (a (b nil (c nil nil) (d nil nil)) nil nil) nil (e nil nil (f nil (g nil nil) nil)))))
         (clone (3tree-clone tree)))
    (assert-equalp tree clone)
    (assert-false (eq tree clone))
    (assert-false (eq (3tree-left tree) (3tree-left clone)))
    (assert-false (eq (3tree-right tree) (3tree-right clone)))
    (assert-false (eq (3tree-left (3tree-left tree)) (3tree-left (3tree-left clone))))
    (assert-false (eq (3tree-right (3tree-right tree)) (3tree-right (3tree-right clone))))
    ))

(define-test 3tree-member
  (let ((tree (list->3tree '(top (a (b nil (c nil nil) (d nil nil))) nil (e nil nil (nil nil (g nil nil) nil))))))
    (assert-true (3tree-member 'top tree))
    (assert-true (3tree-member 'a tree))
    (assert-true (3tree-member 'b tree))
    (assert-true (3tree-member 'd tree))
    (assert-true (3tree-member 'e tree))
    (assert-false (3tree-member 'f tree))
    (assert-true (3tree-member 'nil tree))
    (assert-false (3tree-member 'nil (3tree-left tree)))
    ))


;;; Ex 4.4
;;; requires bst.lisp (Graham's code)

(defun make-bst (l)
  (do ((ll l (cdr ll))
       (bst nil (bst-insert (car ll) bst #'<)))
      ((null ll) bst)))

(define-test bst-elements
  (assert-equal nil (bst-elements (make-bst nil)))
  (assert-equal '(4) (bst-elements (make-bst '(4))))
  (assert-equal '(0 -12) (bst-elements (make-bst '(-12 0))))
  (assert-equal '(10 9 5 3 1) (bst-elements (make-bst '(3 1 5 9 10))))
  )


;;; Ex 4.6

(define-test alist->hash-table
  (let ((ht (alist->hash-table '((a . 1) (b . 2) (c . 3)))))
    (assert-equal 1 (gethash 'a ht))
    (assert-equal 2 (gethash 'b ht))
    (assert-equal 3 (gethash 'c ht))
    (assert-equal 3 (hash-table-count ht)))
  (assert-equal 0 (hash-table-count (alist->hash-table nil)))
  )

(define-test hash-table->alist
  (let ((ht (make-hash-table)))
    (setf (gethash 'a ht) 1 (gethash 'b ht) 2 (gethash 'c ht) 3)
    (assert-equality set-equal '((a . 1) (b . 2) (c . 3)) (hash-table->alist ht)))
  (assert-true (null (hash-table->alist (make-hash-table))))
  )


;;; Chapter 5

;;; Ex 5.5

(define-test preceders
  (assert-equality unordered-equal '(#\c #\d #\r) (preceders #\a "abracadabra"))
  (assert-equality unordered-equal '(#\c #\d #\r #\a) (preceders #\a "aabracadabra"))
  (assert-equality unordered-equal 'nil (preceders #\x "abracadabra"))
  (assert-equality unordered-equal 'nil (preceders #\a ""))
  (assert-equality unordered-equal '(#\x #\c #\d #\r) (preceders #\a "abxacadabra"))
  (assert-equality unordered-equal '(a d) (preceders 'b #(a b c d b a b)))
  (assert-equality unordered-equal nil (preceders 'b #()))
  )

;;; Ex 5.6

(define-test intersperse
  (assert-equal '(a - b - c - d) (intersperse '- '(a b c d)))
  (assert-equal '(a - b) (intersperse '- '(a b)))
  (assert-equal '(a) (intersperse '- '(a)))
  (assert-equal 'nil (intersperse '- 'nil))
  (assert-equal '(nil - b - c) (intersperse '- '(nil b c)))
  (assert-equal '(a - nil - c) (intersperse '- '(a nil c)))
  (assert-equal '(nil) (intersperse '- '(nil)))
  (assert-equal '(a - a - b) (intersperse '- '(a a b)))
  )


;;; Ex 5.7

(define-test diff-by-one-p
  (assert-true (diff-by-one-p '(1 2 3 2 1)))
  (assert-true (diff-by-one-p '(1 2)))
  (assert-false (diff-by-one-p '(1 2 3 -4)))
  (assert-false (diff-by-one-p '(1 3 5 6)))
  (assert-true (diff-by-one-p '(1)))
  (assert-true (diff-by-one-p 'nil))
  (assert-false (diff-by-one-p '(1 2 3 3 2)))
  (assert-error 'error (diff-by-one-p '(1 nil)))
  )

;;; Ex 5.8

(define-test max-min
  (assert-equal (values 4 1) (max-min #(1 2 3 4)))
  (assert-equal (values 10 1) (max-min #(3 1 8 2 10)))
  (assert-equal (values 10 10) (max-min #(10)))
  (assert-equal (values -5 -8) (max-min #(-5 -8)))
  (assert-equal (values 2 2) (max-min #(1 2 3 4) :start 1 :end 2))
  (assert-equal (values nil nil) (max-min #(1 2 3) :start 2 :end 2))
  (assert-equal (values nil nil) (max-min #()))
  )

;;; Ex 5.9

;;; In order to check that a solution is returned immediately,
;;; not queued up, use EMPTY-QUEUE-P to test the queue. 
;;; That will check to see if the path TEST-PATH is looking
;;; for has been added and signal a test failure.

(let ((bad-path nil))

  (defun test-path (path node end net)
    (setq bad-path (reverse path))
    (assert-equal path
                  (shortest-path node end net)))
  
  (defun empty-queue-p (queue)
    (when (member bad-path queue :test 'equal)
      (fail "~S put in queue" bad-path))
    (null queue))
  )

(define-test shortest-path
  ;; Without cycles
    
  (test-path '(a c d) 'a 'd '((a b c) (b c) (c d)))
  (test-path '(a c) 'a 'c '((a b c) (b c) (c d)))
  (test-path '(a c d) 'a 'd '((a b c) (b e) (e c) (c d)))
  (test-path '(a c e f) 'a 'f '((a b c) (b c) (c e) (e f)))
  (test-path '(a b f) 'a 'f '((a b c) (b c f) (c e) (e f)))
  (test-path '()  'a 'f '((a b c) (b c) (c d) (e f)))
  
  ;; With cycles
  (test-path '(a c d) 'a 'd '((a b c) (b a c) (c d)))
  (test-path '(a c) 'a 'c '((a b c) (b c) (c a d)))
  (test-path '() 'a 'c '((a b) (b a) (c)))
  (test-path '() 'a 'f '((a b c) (b a c) (c d) (e f)))
  (test-path '() 'a 'f '((a b c) (b c) (c b) (e f)))

  )

;;; Chapter 6

;;; Ex 6.2

(define-test bin-search
  (assert-equal 1 (bin-search 1 #(1 3 5 7 8 10)))
  (assert-equal 3 (bin-search 3 #(1 3 5 7 8 10)))
  (assert-equal 5 (bin-search 5 #(1 3 5 7 8 10)))
  (assert-equal 7 (bin-search 7 #(1 3 5 7 8 10)))
  (assert-equal 8 (bin-search 8 #(1 3 5 7 8 10)))
  (assert-equal 10 (bin-search 10 #(1 3 5 7 8 10)))
  (assert-equal nil (bin-search 0 #(1 3 5 7 8 10)))
  (assert-equal nil (bin-search 12 #(1 3 5 7 8 10)))
  (assert-equal nil (bin-search 3 #(1 3 5 7 8 10) :start 2))
  (assert-equal 3 (bin-search 3 #(1 3 5 7 8 10) :start 1))
  (assert-equal nil (bin-search 7 #(1 3 5 7 8 10) :end 3))
  (assert-equal 7 (bin-search 7 #(1 3 5 7 8 10) :end 4))
  (assert-equal 7 (bin-search 7 #(1 3 5 7 8 10) :start 2 :end 4))
  (assert-equal nil (bin-search 7 #(1 3 5 7 8 10) :start 2 :end 2))
  (assert-equal nil (bin-search 1 #(1 3 5 7 8 10) :start 3 :end 2))
  (assert-equal '(8 e) (bin-search 8 #((1 a) (3 b) (5 c) (7 d) (8 e) (10 f)) :key #'car))
  (assert-equal '(8 e)
                (bin-search 8 #((1 a) (3 b) (5 c) (7 d) (8 e) (10 f)) :key #'car :start 3 :end 5))
  (assert-equal nil
                (bin-search 8 #((1 a) (3 b) (5 c) (7 d) (8 e) (10 f)) :key #'car :start 3 :end 4))
  (assert-equal nil
                (bin-search 8 #((1 a) (3 b) (5 c) (7 d) (8 e) (10 f)) :key #'car :start 5 :end 6))
  (assert-equal 1 (bin-search 1 #(1)))
  (assert-equal nil (bin-search 1 #(1) :start 1))
  (assert-equal 1 (bin-search 1 #(1) :end 1))
  (assert-equal nil (bin-search 1 #(1) :end 0))
  (assert-equal nil (bin-search 1 #()))
  )

;;; Ex 6.4

(define-test two-most
  (assert-equal (values 1 2) (two-most '/ '(3 1 8 2 10)))
  (assert-equal (values 1 3) (two-most '/ '(3 1 8)))
  (assert-equal (values 2 5) (two-most '/ '(10 2 5 8)))
  (assert-equal (values 8 nil) (two-most '/ '(8)))
  (assert-equal (values 2 2) (two-most '/ '(2 8 2)))
  (assert-equal (values nil nil) (two-most '/ nil))
  (assert-equal (values 8 0) (two-most '1+ '(-1 0 -2 8 -5 -1 0)))
  (assert-equal (values 3 2) (two-most '1+ '(2 3)))
  (assert-equal (values 3 2) (two-most '1+ '(3 2)))
  (assert-equal (values 4 3) (two-most '1+ '(2 3 4)))
  (assert-equal (values 4 3) (two-most '1+ '(2 4 3)))
  (assert-equal (values 4 3) (two-most '1+ '(4 2 3)))
  (assert-equal (values -2 -4) (two-most '1+ '(-2 -4 -5 -8)))
  )

;;; Ex 6.5

(define-test my-remove-if
  (assert-equal '(a b c) (my-remove-if 'null '(nil a b nil c)))
  (assert-equal nil (my-remove-if 'oddp '(1)))
  )

;;; Ex 6.6

(define-test greatest-arg
  (greatest-arg)
  (assert-equal -5 (greatest-arg -5))
  (assert-equal 0 (greatest-arg 0))
  (assert-equal 2 (greatest-arg 2))
  (assert-equal 2 (greatest-arg 0))
  (assert-equal 10 (greatest-arg 10))
  (greatest-arg)
  (assert-equal -5 (greatest-arg -5))
  (assert-equal 0 (greatest-arg 0))
  )



;;; Ex 6.7

(define-test bigger-arg
  (bigger-arg)
  (assert-false (bigger-arg -5))
  (assert-true (bigger-arg 0))
  (assert-true (bigger-arg 20))
  (assert-false (bigger-arg 0))
  (assert-true (bigger-arg 5))
  (bigger-arg)
  (assert-false (bigger-arg 10))
  )

;;; Ex 6.8

;;; We memoize a function fn that prints to make it easy to check
;;; if it was called. The keywords in the assert's are
;;; to make it easier to tell which tests failed, if any.

(defvar *memo-out* nil)
(defun memo-test (x) (prin1 x *memo-out*))
(defun memo-call (fn x)
  (let ((*memo-out* (make-string-output-stream)))
    (list (funcall fn x) (get-output-stream-string *memo-out*))))

(define-test memoize
  (let ((fn1 (memoize #'memo-test)))

    ;; start with new values
    (assert-equal '(x "X") (memo-call fn1 'x) :test1)
    (assert-equal '((a b) "(A B)") (memo-call fn1 '(a b)) :test2)
    (assert-equal '(nil "NIL") (memo-call fn1 nil) :test3)
    
    ;; no calls with old values
    (assert-equal '(x "") (memo-call fn1 'x) :test4)
    (assert-equal '((a b) "") (memo-call fn1 '(a b)) :test5)
    (assert-equal '(nil "") (memo-call fn1 nil) :test6)
    
    ;; make sure a new memoized version of the function
    ;; gets called
    (let ((fn2 (memoize #'memo-test)))
      ;; the old function is still not getting called
      (assert-equal '(x "") (memo-call fn1 'x) :test7)
      ;; and the new one is
      (assert-equal '(x "X") (memo-call fn2 'x) :test8)
      (assert-equal '((a b) "(A B)") (memo-call fn2 '(a b)) :test9)
      (assert-equal '(nil "NIL") (memo-call fn2 nil) :test10)
      
      ;; clear the internal table for the first memoized version
      (assert-equal nil (funcall fn1))
          
      ;; fn1 should be called 
      (assert-equal '(x "X") (memo-call fn1 'x) :test11)
      
      ;; fn2 should not be called
      (assert-equal '(x "") (memo-call fn2 'x) :test12)
      )))


;;; Chapter 7

;;; Ex 7.2 modified

(defun map-stream-list (fn string)
  (let ((l nil))
    (with-input-from-string (in string)
      (map-stream #'(lambda (x) (push (funcall fn x) l))
                  in)
      (nreverse l))))

;; Note: Lispworks adds an unprintable hashtable object to the
;; function lambda expression
(defun make-expected-forms (name)
  (subst-if nil #'hash-table-p 
            (subforms (get-function-body name))))

(defun get-function-body (name)
  (or (function-lambda-expression (symbol-function name))
      (error "Can't test ~s because it's compiled; copy and paste your definition into the listener and try again" name)))

(defun make-test-text (forms)
  (let ((*print-level* nil)
        (*print-length* nil))
    (format nil "~{~S~%~} ;;" forms)))

(defun make-testing-forms (expected actual)
  (let ((alen (length actual))
        (elen (length expected)))
    (and (< alen elen)
         (subseq expected (max 0 (- alen 1)) (min elen (+ alen 3))))))

  
(defun subforms (l)
  (adjoin l
          (and (consp l)
               (union (subforms (car l)) 
                      (subforms (cdr l))))))

(define-test map-stream
  (assert-equal nil (map-stream-list #'identity "   "))
  (assert-equal '(nil) (map-stream-list #'identity "nil"))
  (assert-equal '(1 a (2 3)) (map-stream-list #'identity "  1 a (2 3)  "))
  (assert-equal '(a nil b c) (map-stream-list #'identity "a nil b c"))
  (assert-equal '(a eof b c) (map-stream-list #'identity "a eof b c"))
  (assert-equal '(2 3 4) (map-stream-list #'1+ "1 2 3"))
  (assert-equal '(a b c) (map-stream-list #'identity "a b c ;;"))

  (let* ((expected (make-expected-forms 'map-stream))
         (actual (map-stream-list #'identity (make-test-text expected)))
         (test-forms (make-testing-forms expected actual)))
    (unless (null test-forms)
      (let ((test-text (make-test-text test-forms)))
        (assert-equal test-forms 
                      (map-stream-list #'identity test-text)
                      test-text))))
  )

;;; Ex 7.3 modified

(defun extract-code-from-string (str)
  (with-input-from-string (in str)
    (extract-code-from-stream in)))

(define-test extract-code-from-stream
  (assert-prints "" (extract-code-from-string ""))
  (assert-prints "" (extract-code-from-string "<html>foo baz pre </html>"))
  (assert-prints "(a b)
(c 
d)"
                 (extract-code-from-string "<html>foo<pre>(a b)</pre>baz <pre>   (c 
d)</pre> pre</html>"))
  (assert-prints ""
                 (extract-code-from-string "<prevent>(b a d)</prevent>"))
)

;;; Ex 7.5

;;; Requires Graham's BUF and STREAM-SUBST code
;;;
;;; Tests courtesy of David Raffensperger 

(defun string-subst (old new str &key (wildcard '#\+))
  (with-input-from-string (in str)
    (with-output-to-string (out)
      (stream-subst old new in out :wildcard wildcard))))

(define-test stream-subst
  (assert-equal "" (string-subst "" "" ""))
  (assert-equal "d c" (string-subst "a" "d" "a c"))
  (assert-equal "d c dd" (string-subst "a" "d" "a c aa"))
  (assert-equal "ddd" (string-subst "+" "d" "abc"))
  (assert-equal "ddd" (string-subst "-" "d" "abc" :wildcard #\-))
  (assert-equal "" (string-subst "+" "" ""))
  (assert-equal "" (string-subst "+" "" "" :wildcard #\-))
  (assert-equal "" (string-subst "-" "" "" :wildcard #\-))
  (assert-equal "an apple furthermore a pear"
                (string-subst "and" "furthermore" "an apple and a pear"))
  (assert-equal "an apple and a pear and a man and a dog"
                (string-subst "furthermore" "and"
                              "an apple furthermore a pear and a man furthermore a dog"))
  (assert-equal "a dogr is open, a dog is dogted"
                (string-subst "do+" "dog"
                              "a door is open, a dog is dotted"))
  (assert-equal "a door is open, a dog is dotted"
                (string-subst "do+" "dog"
                              "a door is open, a dog is dotted"
                              :wildcard #\-))
  (assert-equal "a dogr is open, a dog is dogted"
                (string-subst "do-" "dog"
                              "a door is open, a dog is dotted"
                              :wildcard #\-))
  
  (assert-equal "Ralph xxxCxx" (string-subst #(:digit) "x" "Ralph 124C41"))
  (assert-equal "xxxxx xxxxxx" (string-subst #(:alphanumeric) "x" "Ralph 124C41"))
  (assert-equal "Ralph 12x41" (string-subst #(:digit :alpha) "x" "Ralph 124C41"))
  (assert-equal "Ralph 1x41" (string-subst #(:digit :wild :alpha) "x" "Ralph 124C41"))
  )



;;; Chapter 8

;;; Ex 8.4

(define-test ring-package
  (assert-equal "Ignore C. Lisp and only Lisp is worth learning"
                (with-output-to-string (out)
                  (with-input-from-string (in "Ignore C. C++ and only C++ is worth learning")
                    (funcall (read-from-string "file:stream-subst") 
                             "C++" "Lisp" in out))))
  (assert-true (fboundp (read-from-string "file:file-subst")))
  )

;;; Ex 8.5


(define-test henley-p
  (assert-true (henley-p ""))
  (assert-false (henley-p "how now brown cow"))
  (assert-true (henley-p "therefore on what the north ; mystical dance not informidable ! thus high above all embroiled , the anarch old"))
  (assert-false (henley-p "but places high power and more strength"))
  )


;;; Chapter 9

;;; Ex 9.2

(define-test make-change
  (assert-equal (values 2 1 1 2) (make-change 67))
  (assert-equal (values 2 0 0 0) (make-change 50))
  (assert-equal (values 0 0 0 4) (make-change 4))
  (assert-equal (values 0 0 0 0) (make-change 0))
  
  (assert-equal (values 2 0 0 0 1 1) (make-change 67 '(32 16 8 4 2 1)))
  (assert-equal (values 1 1 0 0 1 0) (make-change 50 '(32 16 8 4 2 1)))
  (assert-equal (values 0 0 0 1 0 0) (make-change 4 '(32 16 8 4 2 1)))
  )

(define-test make-best-change
  (assert-equal (values 2 1 1 2) (make-best-change 67))
  (assert-equal (values 2 0 0 0) (make-best-change 50))
  (assert-equal (values 0 0 0 4) (make-best-change 4))
  (assert-equal (values 0 0 0 0) (make-best-change 0))
  (assert-equal (values 0 3 0) (make-best-change 30 '(25 10 1)))
  (assert-equal (values 1 3) (make-best-change 32 '(11 7)))
  (assert-equal (values 1 5 0) (make-best-change 88 '(23 13 5)))
  (assert-equal (values 1 1) (make-best-change 11 '(7 3)))
  (assert-equal (values 2 0 1) (make-best-change 21 '(10 5 1)))
  )

;;; Ex 9.4

(defun segment-equals (results correct)
  (or (equal results correct)
      (and (= (length correct) 4)
           (equal (first results) (third correct))
           (equal (second results) (fourth correct))
           (equal (third results) (first correct))
           (equal (fourth results) (second correct)))))


(define-test intersect-segments
  (assert-equality segment-equals 
                   '(2 2 3 3)
                   (multiple-value-list (intersect-segments 1 1 3 3 2 2 4 4)))
  (assert-equality segment-equals
               '(2 2 3 3) 
               (multiple-value-list (intersect-segments 3 3 1 1 2 2 4 4)))
  (assert-equality segment-equals 
                   '(2 2 3 3) 
                   (multiple-value-list (intersect-segments 1 1 3 3 2 2 5 5)))
  (assert-equal '(nil)
                (multiple-value-list (intersect-segments 1 1 2 2 3 3 4 4)))
  (assert-equality segment-equals 
                   '(2 2 2 2)
                   (multiple-value-list (intersect-segments 1 1 2 2 2 2 3 3)))
  (assert-equality segment-equals
                   '(2 2) 
                   (multiple-value-list (intersect-segments 1 1 3 3 3 1 1 3)))
  (assert-equal '(nil) 
                (multiple-value-list (intersect-segments 1 1 3 3 4 0 3 1)))
  (assert-equality segment-equals
                   '(0 0) 
                   (multiple-value-list (intersect-segments -1 1 1 -1 0 0 1 1)))
  (assert-equal '(nil) 
                (multiple-value-list (intersect-segments -3 1 0 -2 -2 1 -1 0)))
  (assert-equality segment-equals
                   '(-2 1 -1 0)
                   (multiple-value-list (intersect-segments -3 2 1 -2 -2 1 -1 0)))
  (assert-equality segment-equals
                   '(2 2 2 2) 
                   (multiple-value-list (intersect-segments 2 2 2 2 2 2 2 2)))
  (assert-equality segment-equals 
                   '(2 3 2 4) 
                   (multiple-value-list (intersect-segments 2 2 2 4 2 3 2 5)))
  (assert-equal '(nil) 
                (multiple-value-list (intersect-segments 2 2 2 2 3 3 3 3)))
  
  (assert-equality segment-equals
                   '(2 2 2 2)
                   (multiple-value-list (intersect-segments 2 2 2 2 1 1 3 3)))
  (assert-equality segment-equals
                   '(2 2 2 2)
                   (multiple-value-list (intersect-segments 0 0 2 2 2 2 2 2)))
  (assert-equal '(nil)
                (multiple-value-list (intersect-segments 0 0 1 1 2 2 2 2)))
  (assert-equal '(nil)
                (multiple-value-list (intersect-segments 2 3 2 3 1 1 5 5)))

  )


;;; Ex 9.5

(defun poly1-2-5 (x)
  (- (* x x) (* 2 x) 5))

(defun poly1-0-9 (x)
  (- (* x x) 9))

(defun epsilon-equals (returned correct)
  (< (abs (- returned correct)) 0.01))

(define-test solve
  (assert-equality epsilon-equals 3.4494896 (solve 'poly1-2-5 1 5 0.01))
  (assert-equality epsilon-equals 3 (solve 'poly1-0-9 2.8 3.2 0.01))
  (assert-equality epsilon-equals -3 (solve 'poly1-0-9 -11.1 -2.9 0.01))
  (assert-equal 3.0 (solve 'poly1-0-9 2.8 3.2 0.01))
  (assert-equal 3.0 (solve 'poly1-0-9 2.0 3.0 0.01))
  (assert-equal 3.0 (solve 'poly1-0-9 3.0 4.0 0.01))
  )

;;; Ex 9.6

(define-test horner
  (assert-equality epsilon-equals -2 (horner '3 1 -2 -5))
  (assert-equality epsilon-equals 10 (horner '-3 1 -2 -5))
  (assert-equality epsilon-equals 5 (horner '3 5))
  (assert-equality epsilon-equals -4 (horner '-3 2 4 -2 8))
  )

;;; Chapter 10

;;; Ex 10.3

(define-test nth-expr
  (assert-equal 3 (let ((n 2)) (nth-expr n (/ 1 0) (+ 1 2) (/ 1 0))))
  (assert-error 'division-by-zero 
                (let ((n 1)) (nth-expr n (/ 1 0) (+ 1 2) (/ 1 0))))
  (assert-prints "win"
                 (let ((n 3) (x "lose") (y "win"))
                   (nth-expr n (princ x) (princ x) (princ y) (princ x))))
  (assert-equal 3
                (let ((n 2)) (nth-expr (incf n) 1 2 3 4 5)))
  (assert-true (functionp (coerce (lambda (n) (nth-expr n 'a 'b 'c)) 'function)))
  )


;;; Ex 10.5

(define-test n-of
  (assert-equal '(1 2 3 4) (let ((i 0) (n 4)) (n-of n (incf i))))
  (assert-equal '(a) (let* ((l '(1 2 3)) (pop l)) (n-of (pop l) 'a)))
  (assert-true (functionp (compile nil (lambda (n) (n-of n 'a)))))
  )

;;; Ex 10.6

(define-test preserve
  (assert-equal 10 (progn (preserve (*read-base*) (setq *read-base* 2)) *read-base*))
  (assert-equal 'a (let ((x 'a)) (preserve (x) (setq x 'b)) x))
  (assert-equal 10 (preserve (*read-base*) *read-base*))
  (assert-equal 'a (let ((x 'a)) (preserve (x) x)))
  (assert-equal '(10 "1010" a)
                (let ((x 'a) (str nil))
                  (preserve (*print-base* x) (setq *print-base* 2 x 'b)
                   (setq str (format nil "~s" 10)))
                  (list *print-base* str x)))
  )

;;; Ex 10.8

(define-test doublef
  (assert-equal 10 (let ((n 5)) (doublef n) n))
  (assert-equal 10 (let ((n 5)) (doublef n)))
  (assert-equal '(10 2) (let ((l (list 5 2))) (doublef (car l)) l))
  (assert-equal 10 (let ((l (list 5 2))) (doublef (car l))))
  (assert-equal '(10 2) 
                (let ((i -1) (l (list 5 2))) 
                  (doublef (nth (incf i) l)) 
                  l))
  )

;;; Chapter 11

;;; Ex 11.1 and 11.5

;;; to be written

;;; Ex 11.2
;;;
;;; Tests written by William Flahive and Bew Harichanwong

(defun minroot (a b c)
  (if (zerop a)
      (/ (- c) b)
      (let ((disc (- (sq b) (* 4 a c))))
        (unless (minusp disc)
          (let ((discrt (sqrt disc)))
            (min (/ (+ (- b) discrt) (* 2 a))
                 (/ (- (- b) discrt) (* 2 a))))))))

(defun sq (x) (* x x))

(defun mag (x y z)
  (sqrt (+ (sq x) (sq y) (sq z))))

(defun unit-vector (x y z)
  (let ((d (mag x y z)))
    (values (/ x d) (/ y d) (/ z d))))


(define-test normal
    (assert-equal (values -0.26726124 -0.5345225 -0.8017837)
                  (let* ((s1 (make-instance 'sphere :radius 3))
                         (p1 (make-instance 'point :x 1 :y 2 :z 3)))
                    (normal s1 p1)))
  
  (assert-equal (values 0.26726124 0.5345225 0.8017837)
                (let* ((p1 (make-instance 'point :x 1 :y 2 :z 3))
                       (s1 (make-instance 'sphere :radius 3 :center p1))
                       (p2 (make-instance 'point)))
                  (normal s1 p2))))


(define-test intersect
    (let* ((p1 (make-instance 'point :x 1 :y 2 :z 3))
           (s1 (make-instance 'sphere :radius 3 :center p1))
           (p2 (make-instance 'point))
           (ans (intersect s1 p2 1 1 1)))
      (assert-equal 0.47247472 (x ans))
      (assert-equal 0.47247472 (y ans))
      (assert-equal 0.47247472 (z ans))))


;;; Chapter 12

(define-test make-queue
  (assert-equal '(nil) (make-queue))
  (assert-equal '((1 2 3) 3) (make-queue 1 2 3))
  (assert-equal '((1 2 3) 3) (flet ((fn nil (make-queue 1 2 3))) (enqueue 4 (fn)) (fn)))
  )

(define-test empty-queue-p
  (assert-true (empty-queue-p (make-queue)))
  (assert-false (empty-queue-p (make-queue 1)))
  )

;;; Ex 12.3

(define-test copy-queue
  (assert-equal '(nil) (let* ((q (make-queue)) (qc (copy-queue q))) qc))
  (assert-equal '(nil) (let* ((q (make-queue)) (qc (copy-queue q))) (enqueue 1 q) qc))
  (assert-equal '((1 2 3 4) 4) (let* ((q (make-queue 1 2 3 4)) (qc (copy-queue q))) qc))
  (assert-equal '((1 2 3 4) 4) 
                (let* ((q (make-queue 1 2 3 4)) (qc (copy-queue q))) (dequeue q) qc))
  (assert-equal '((1 2 3 4) 4) 
                (let* ((q (make-queue 1 2 3 4)) (qc (copy-queue q))) (enqueue 5 q) qc))
  (assert-equal '((1 2 3 4 5) 5) 
                (let* ((q (make-queue 1 2 3 4)) (qc (copy-queue q))) (enqueue 5 qc) qc))
  )


;;; Ex 12.4

(define-test enqueue-front
  (assert-equal '((a) a) (let ((q (make-queue))) (enqueue-front 'a q) q))
  (assert-equal '((4 1 2 3) 3) (let ((q (make-queue 1 2 3))) (enqueue-front 4 q) q))
  (assert-equal '((a b) b) (let ((q (make-queue))) (enqueue-front 'a q) (enqueue 'b q) q))
  )

;;; Ex 12.5

(define-test requeue-front
  (assert-equal '((1 2 3) 3) (let ((q (make-queue 1 2 3))) (requeue-front 1 q) q))
  (assert-equal '((2 1 3) 3) (let ((q (make-queue 1 2 3))) (requeue-front 2 q) q))
  (assert-equal '((3 1 2) 2) (let ((q (make-queue 1 2 3))) (requeue-front 3 q) q))
  (assert-equal '((1 2 3) 3) (let ((q (make-queue 1 2 3))) (requeue-front 4 q) q))
  (assert-equal '((1 2 1 3) 3) (let ((q (make-queue 1 2 1 3))) (requeue-front 1 q) q))
  (assert-equal '((2 1 1 2 3) 3) (let ((q (make-queue 1 2 1 2 3))) (requeue-front 2 q) q))
  (assert-equal '((3 1 2 4) 4)
                (let ((q (make-queue 1 2 3))) (requeue-front 3 q) (enqueue 4 q) q))
  )

;;; Ex 12.6

(define-test circular-member-p
  (let ((*print-circle* t))
    (assert-true (circular-member-p 1 '(1 2 3 4)))
    (assert-true (circular-member-p 2 '(1 2 3 4)))
    (assert-true (circular-member-p 4 '(1 2 3 4)))
    (assert-false (circular-member-p 5 '(1 2 3 4)))
    (assert-false (circular-member-p 1 nil))
    (assert-false (circular-member-p nil '(1 2 3 4)))
    (assert-true (circular-member-p 1 '#1=(1 2 3 4 . #1#)))
    (assert-true (circular-member-p 2 '#2=(1 2 3 4 . #2#)))
    (assert-true (circular-member-p 3 '#3=(1 2 3 4 . #3#)))
    (assert-true (circular-member-p 4 '#4=(1 2 3 4 . #4#)))
    (assert-false (circular-member-p 5 '#5=(1 2 3 4 . #5#)))
    (assert-true (circular-member-p 1 '#6=(1 . #6#)))
    (assert-false (circular-member-p 5 '#7=(1 . #7#)))
    (assert-true (circular-member-p 3 '(1 2 3 4 5 6 7 8 . #8=(9 10 11 . #8#))))
    (assert-true (circular-member-p  4 '#9=(1 2 3 4 . #9#)))
    (assert-true (circular-member-p 7 '(1 2 3 4 . #10=(5 6 7 . #10#))))
    (assert-true (circular-member-p 11 '(1 2 3 4 5 6 7 8 . #11=(9 10 11 . #11#))))
    (assert-false (circular-member-p 3 '(1 2 . #12=(4 5 6 . #12#))))
    (assert-true (circular-member-p nil '#13=(1 2 3 4 nil . #13#)))    
    (assert-false (circular-member-p nil '#14=(1 2 (3 4) . #14#)))   
    (assert-false (circular-member-p nil '(1)))
    ))

;;; Ex 12.7

(define-test cdr-circular-p
  (let ((*print-circle* t))
    (assert-false (cdr-circular-p '(1 2 3 4)))
    (assert-true (cdr-circular-p '#1=(1 2 3 4 . #1#)))
    (assert-true (cdr-circular-p '(1 2 3 4 5 6 7 8 . #2=(9 10 11 . #2#))))
    (assert-false (cdr-circular-p '(1 2 3 4 5 6 7 8 . #3=(9 10 11 #3#))))
    (assert-false (cdr-circular-p nil))
  ))

;;; Ex 12.8

(define-test car-circular-p
  (let ((*print-circle* t))
    (assert-false (car-circular-p '(1 2 3 4)))
    (assert-false (car-circular-p '#1=(1 2 3 4 . #1#)))
    (assert-false (car-circular-p '((1 2) 3 4)))
    (assert-true (car-circular-p '#2=(#2#)))
    (assert-true (car-circular-p '#3=((1 2) 3 #3#)))
    (assert-false (car-circular-p '(#4=(1 2) 3 #4#)))
    (assert-false (car-circular-p '(((1 2 3)) 4 ((5 6)))))
    (assert-false (car-circular-p '(((1 2 . #5=(3))) 4 ((5 . #5#)))))
    (assert-false (car-circular-p '(#6=((1 2 3)) 4 ((5 . #6#)))))
    (assert-true (car-circular-p '(((1 2 3)) 4 . #7=(((5 . #7#))))))
    (assert-true (car-circular-p '#8=(1 2 (((3 #8#))) 4)))
    (assert-false (car-circular-p '(#9=(1 2 3 . #9#))))
    (assert-true (car-circular-p '#10=(#11=((1 2) 3 #11#) 2 3 . #10#)))
    (assert-true (car-circular-p '#12=(a . ((b . #12#) . c))))
    (assert-true (car-circular-p '((#13=(1 2 . #13#)) #14=((3 . #14#)))))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tests for exercises on Lisp Exercises page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Ex Lisp #1

(define-test has-number-p
 (assert-false (has-number-p 'nil))
 (assert-true (has-number-p 1))
 (assert-false (has-number-p 'a))
 (assert-true (has-number-p '(1)))
 (assert-false (has-number-p '(a)))
 (assert-true (has-number-p '(a (1))))
 (assert-false (has-number-p '(a (a))))
 (assert-true (has-number-p '((a 1) c d)))
 (assert-true (has-number-p '((a b) (c 1))))
 )

;;; Ex Lisp #2

(define-test key-if
  (assert-expands '(cond (flag x y) (t nil)) (key-if flag :then x y))
  (assert-expands '(cond (flag x y) (t z w)) (key-if flag :then x y :else z w))
  (assert-expands '(cond (flag nil) (t z w)) (key-if flag :else z w))
  (assert-expands '(cond (flag x y) (t z w)) (key-if flag :else z w :then x y))
  (assert-equal 'ok (let ((n 2)) (key-if (> n 1) :else 'oops :then 'ok)))
  )

;;; Ex Lisp #3

(define-test make-balance
  (let ((bal-1 (make-balance 100))
        (bal-2 (make-balance -100)))
    (assert-equal 100 (funcall bal-1))
    (assert-equal 110 (funcall bal-1 10))
    (assert-equal 105 (funcall bal-1 -5))
    (assert-equal 105 (funcall bal-1))
    (assert-equal -100 (funcall bal-2)))
  )


;;; Ex Lisp #4

(define-test delete-car
  (let ((l (list 1 2 3 4)))
    (assert-equal '(2 3 4) (delete-car l) l)
    (assert-equal '(2 3 4) l l)
    (assert-equal '(3 4) (delete-car l) l)
    (assert-equal '(3 4) l l)
    (assert-equal '(4) (delete-car l) l)
    (assert-equal '(4) l l)
    (assert-equal 'nil (delete-car l) l))
  (assert-equal nil (delete-car nil))
  (assert-equal 2 (delete-car (cons 1 2)))
  (assert-error 'error (delete-car 1))
  (assert-equal '(nil 2) (delete-car (list 1 nil 2)))
  (assert-equal '(2 1) (delete-car (list 1 2 1)))
  (assert-equal '(2 1) (funcall #'delete-car (list 1 2 1)))
  )

;;; Ex Lisp #5

(define-test collect-numbers
  (assert-equal nil (collect-numbers nil))
  (assert-equal nil (collect-numbers 'b))
  (assert-equal '(3) (collect-numbers '3))
  (assert-equal '(1 2 3) (collect-numbers '(1 2 3)))
  (assert-equal '(1 2 3) (collect-numbers '(1 (b (2 c) ((3))))))
  (assert-equal '(1 3) (collect-numbers '(1 nil (3 nil))))
  (assert-equal '(4 1 8 2) (collect-numbers '(((4) 1) (8 ((2))))))
  )

;;; Ex Lisp #6

(define-test tconc
  (let* ((l1 (list 1 2))
         (tc (make-tconc l1))
         (l2 (list 'a 'b)))
    (assert-eq l1 (tconc tc))
    (assert-equal '(1 2) (tconc tc))
    (assert-equal '(1 2 3 4) (tconc tc 3 4))
    (assert-equal '(1 2 3 4) (tconc-list tc nil))
    (assert-equal '(1 2 3 4 a b) (tconc-list tc l2))
    (assert-equal '(a b) l2)
    (assert-equal '(1 2 3 4 a b) (tconc tc))
    (assert-eq l1 (tconc tc))
    (assert-eq (tconc tc) (tconc tc)))
  (let ((tc (make-tconc)))
    (assert-equal nil (tconc tc))
    (assert-equal '(1) (tconc tc 1))
    (assert-equal '(1 2 3) (tconc tc 2 3))
    (assert-equal '(1 2 3) (tconc tc)))
  )

;;; Ex Lisp #7

(define-test list-of
  (assert-equal '(2 3 4) (list-of (1+ x) (x :in '(1 2 3))))
  (assert-equal '(2 4) (list-of (1+ x) (x :in '(1 2 3)) (oddp x)))
  (assert-equal '((a a) (a b) (b a) (b b))
                (list-of (list x y) (x :in '(a b)) (y :in '(a b))))
  (assert-equal '((1 2) (1 4) (3 2) (3 4))
                (list-of (list x y) (x :in '(1 2 3 4))
                         (oddp x) (y :in '(1 2 3 4)) (evenp y)))
  (assert-equal '((1 2) (1 4) (3 2) (3 4))
                (list-of (list x y) (x :in '(1 2 3 4))
                         (y :in '(1 2 3 4)) (oddp x) (evenp y)))
  (assert-equal '((1 6) (2 5) (3 4) (4 3))
                (list-of (list x y) (x :in '(1 2 3 4)) 
                         (y :in '(3 4 5 6))
                         (= 7 (+ x y))))
  (assert-equal '(t) (list-of t))
  (assert-equal '(nil) (list-of nil))
  (assert-equal '(3 5 7) (list-of (x :in '(2 3 4 5 6 7 8)) (oddp x)))
  )

;;; Ex Lisp #9

(define-test with-collector
  (with-collector collect
    (assert-equal '(1) (collect 1))
    (assert-equal '(1 nil) (collect nil))
    (assert-equal '(1 nil a) (collect 'a)))
  
  (assert-equal '(1 3)
                 (with-collector collect
                   (dolist (x '(1 2 3 4))
                     (when (oddp x) (collect x)))))
  
  (let ((odds (list 'odds)))
    (with-collector (collect odds)
      (dolist (x '(1 2 3 4))
        (when (oddp x) (collect x))))
    (assert-equal '(odds 1 3) odds))
  )

;;; Ex Lisp #10

(define-test tokenizer 
  (flet ((split-string (str &optional (delim #\space))
          (let ((tr (make-tokenizer str delim)))
            (do ((l nil (cons (next-token tr) l)))
                ((not (next-token-p tr)) (nreverse l))))))
  
    (assert-equal '("now" "is" "the" "time")
                  (split-string " now  is the time  "))
    (assert-equal '("12" "132" "abc")
                  (split-string "12,132,abc" #\,))
    (assert-equal '("" "12" "132" "" "abc")
                  (split-string ",12,132,,abc" #\,))
    (assert-equal '("" "")
                  (split-string "," #\,))
    
    (assert-equal () (split-string "  "))
    (assert-equal '("") (split-string "" #\,))
    (assert-equal '("  ") (split-string "  " #\,))
    ))

;;; Ex Lisp #11

(define-test map-range
  (assert-equal '(1 2 3 4 5 6 7 8 9) (map-range 'identity 1 10))
  (assert-equal '(0 1 4 9 16) (map-range (lambda (n) (* n n)) 0 5))
  (assert-equal nil (map-range (lambda (n) (* n n)) 5 5))
  (assert-equal '(5 4 3 2 1) (map-range 'identity 5 0))
  )

(define-test find-range
  (assert-equal 5 (find-range (lambda (n) (= (mod 35 n) 0)) 2 6))
  (assert-equal nil (find-range (lambda (n) (= (mod 37 n) 0)) 2 20))
  (let ((d nil))
    (assert-equal 5 (find-range (lambda (n)
                                  (if (and (null d) (= (mod 35 n) 0))
                                      (setq d n)
                                    nil))
                                2 6)))
  (assert-equal 7 (find-range (lambda (n) (= (mod 35 n) 0)) 10 2))
  )

(define-test every-range
  (assert-true (every-range (lambda (n) (> (mod 37 n) 0)) 2 30))
  (assert-false (every-range (lambda (n) (> (mod 35 n) 0)) 2 30))
  (assert-true (every-range (lambda (n) (> (mod 37 n) 0)) 30 2))
  (assert-false (every-range (lambda (n) (> (mod 35 n) 0)) 30 2))

  (assert-true (every-range (lambda (n) nil) 5 5))
  (assert-false (every-range (lambda (n) nil) 5 4))
  )

;;; Ex Lisp #12

(define-test reduce-tree
  (assert-equal 15 (reduce-tree '+ '((1 (2 3) (((4)))) 5) 0))
  (assert-equal '(f e d c b a) 
                (reduce-tree (lambda (x y) (cons y x)) 
                             '(a (b (c d) e) f)))
  (assert-equal '(d c b a) 
                (reduce-tree (lambda (x y) (cons y x)) 
                             '(a (b nil c) d)))
  (assert-equal 1 (reduce-tree '* nil 1))
  (assert-equal 3 (reduce-tree '+ 2 1))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BugWeb Exercises
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-test functions-referenced
  (assert-equality 'set-equal nil (functions-referenced nil))
  (assert-equality set-equal nil (functions-referenced 'a))
  (assert-equality set-equal nil (functions-referenced 1))
  (assert-equality set-equal '(car) (functions-referenced '(car l)))
  (assert-equality set-equal '(+ car cdr) (functions-referenced '(+ (car l) (cdr l))))
  (assert-equality set-equal '(list quote) (functions-referenced '(list 'a 'b)))
  (assert-equality set-equal '(+ *) (functions-referenced '(+ (* x y) (* y z))))
  (assert-equality set-equal nil (functions-referenced "(car '(a b c))"))
  (assert-equality set-equal '(member function equal) (functions-referenced '(member x l :test #'equal)))
  (assert-equality set-equal '(let car cdr cond null +)
   (functions-referenced '(let ((x (car l)) (r (cdr l))) (cond ((null l) (+ x 2)) (t r)))))
  (assert-equality set-equal '(lambda car) (functions-referenced '(lambda (l) (car l))))
  (assert-equality set-equal '(do length 1-  cons null reverse print cdr)
   (functions-referenced
    '(do ((n (length l) (1- n)) (l nil (cons n l)))
         ((null l) (reverse l))
       (print n)
       (print (cdr l)))))
  (assert-equality set-equal '(defun + car cdr) (functions-referenced '(defun foo (x y) (+ (car x) (cdr y)))))
  (assert-equality set-equal '(defun 1+ + car cdr)
   (functions-referenced '(defun foo (x y &optional (z (1+ x))) (+ (car x) (cdr y)))))
  (assert-equality set-equal '(defun max min list)
   (functions-referenced '(defun foo (x y &key (big (max x y)) (small (min x y))) (list big small))))
  )

;;; requires bugmops.lisp

(define-test common-absts
  (assert-equality set-equal '(m-test-taking-function m-non-destructive-function)
   (common-absts 'remove 'member))
  (assert-equality set-equal '(m-sequence-function) (common-absts 'remove 'delete))
  (assert-equality set-equal '(m-test-taking-function) (common-absts 'delete 'member))
  (assert-equality set-equal '(m-function) (common-absts 'nconc 'member))
  (assert-equality set-equal nil (common-absts 'foo 'member))
  )

(define-test absts-abstp
  ;; all the regular tests
  (assert-true (absts-abstp '(m-test-taking-function) '(m-sequence-function)))
  (assert-false (absts-abstp '(m-sequence-function) '(m-test-taking-function)))
  (assert-true (absts-abstp '(m-sequence-function) '(m-non-destructive-function m-input-function)))
  (assert-false (absts-abstp '(m-non-destructive-function m-input-function) '(m-sequence-function)))
  (assert-false (absts-abstp '(m-sequence-function) '(m-sequence-function)))
  (assert-false (absts-abstp '(m-sequence-function m-io-function) '(m-test-taking-function m-output-function)))
  (assert-false (absts-abstp '(m-test-taking-function m-output-function) '(m-sequence-function m-io-function)))
  (assert-false (absts-abstp '(member) '(m-test-taking-function m-non-destructive-function)))
  (assert-true (absts-abstp '() '(m-callable)))
  (assert-false (absts-abstp '(m-callable) '()))
  (assert-false (absts-abstp '() '()))

  ;; tests added from problem spec
  (assert-true (absts-abstp '(m-output-function) '(m-test-taking-function m-destructive-function)))

  ;; new tests
  (assert-false (absts-abstp '(m-non-destructive-function) '(m-destructive-function)))
  (assert-false (absts-abstp '(m-destructive-function) '(m-non-destructive-function)))
  (assert-false (absts-abstp '(m-non-destructive-function) '(m-destructive-function)))
  (assert-false (absts-abstp '(m-non-destructive-function) '(m-destructive-function)))
  (assert-false (absts-abstp '(m-non-destructive-function) '(m-sequence-function)))
  (assert-false (absts-abstp '(m-sequence-function) '(m-non-destructive-function)))
  )


(define-test ?is-a
  (assert-true (pat-match '(?is-a m-test-taking-function) 'member))
  (assert-true (pat-match '(?is-a m-sequence-function) 'remove))
  (assert-true (pat-match '(?is-a m-test-taking-function) 'remove))
  (assert-false (pat-match '(?is-a m-sequence-function) 'member))
  (assert-equal '(((x . member)))
                (pat-match '((? x) (?is-a m-sequence-function)) '(member remove)))
  )

(define-test member-match
  (let ((pat '((?or member remove) '(?and (?is listp) (? x)) '((?*) (? x) (?*)))))
    (assert-true (pat-match pat '(member '(a) '((a) (b) (c)))))
    (assert-true (pat-match pat '(member '(b) '((a) (b) (c)))))
    (assert-true (pat-match pat '(remove '(b) '((a) (b) (c)))))
    (assert-false (pat-match pat '(member 'a '(a b c))))
    (assert-false (pat-match pat '(member '(a) '(((a)) (b) (c)))))
    (assert-false (pat-match pat '(member '(a) '((a) (b)) :test #'equal)))
    ))


(define-test test-taking-match
  (let ((pat '((?is-a m-test-taking-function)
               (quote (?and (?is listp) (? x)))
               (quote ((?*) (? x) (?*))))))
    (assert-true (pat-match pat '(member '(a) '((a) (b) (c)))))
    (assert-true (pat-match pat '(member '(b) '((a) (b) (c)))))
    (assert-true (pat-match pat '(remove '(b) '((a) (b) (c)))))
    (assert-false (pat-match pat '(member 'a '(a b c))))
    (assert-false (pat-match pat '(member '(a) '(((a)) (b) (c)))))
    (assert-false (pat-match pat '(member '(a) '((a) (b)) :test #'equal)))
    ))

(provide "exercise-tests")

(in-package :ddr-tests)


#|
Copyright (c) 2007 Christopher K. Riesbeck

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the "Software"), 
to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the 
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included 
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
OTHER DEALINGS IN THE SOFTWARE.
|#

;;; Test cases for the exercises in ddr-exs.html

;;; UPDATES
;;; 10/15/10 Changed tests to load rule sets automatically [CKR]
;;; 10/13/10 Added test to MEMBER [CKR]
;;; 09/21/09 Moved Shakey tests to separate file and package [CKR]
;;; 02/09/08 Added a test to MEMBER [CKR]
;;; 02/07/08 Added another test to ALL-DIFFERENT (from Jeremy Meisel) [CKR]
;;; 02/02/08 Added tests to MEMBER [CKR]

;;; MEMBER

(declaim (special *member-kb*))

(define-test member
   (init-kb *member-kb*)
  
  (assert-false (ask '(member a nil)))
  (assert-true (ask '(member a (cons a nil))))
  (assert-false (ask '(member nil (cons a nil))))
  (assert-true (ask '(member b (cons a (cons b (cons c nil))))))
  (assert-true (ask '(member c (cons a (cons b (cons c nil))))))
  (assert-false (ask '(member d (cons a (cons b (cons c nil))))))
  (assert-false (ask '(member nil nil)))
  (assert-false (ask '(member a a)))
  (assert-false (ask '(member a (cons (cons a nil) (cons b nil)))))
  )


;;; ALL-DIFFERENT

(declaim (special *all-different-kb*))

(define-test all-different
  (init-kb *all-different-kb*)
  
  (assert-false (ask '(different a b)))
  (tell '(all-different nil))
  (assert-false (ask '(different a b)))
  (tell '(all-different (cons a (cons b (cons c nil)))))
  (assert-true (ask '(different a b)))
  (assert-true (ask '(different a c)))
  (assert-true (ask '(different b a)))
  (assert-true (ask '(different b c)))
  (assert-true (ask '(different c a)))
  (assert-true (ask '(different c b)))
  (assert-false (ask '(different a a)))
  (assert-false (ask '(different a d)))
  )

;;; MAP COLORING

(declaim (special *map-color-kb*))

(define-test color-map1
  (init-kb *map-color-kb*)

  (assert-equal '((colors-for map1 red blue green yellow))
                (ask '(colors-for map1 red blue green ?d)))
  (assert-equal 2 (length (ask '(colors-for map1 red blue ?c ?d))))
  (assert-equal 24 (length (ask '(colors-for map1 ?a ?b ?c ?d))))
  (assert-equal nil (ask '(colors-for map1 red blue green red)))
  )

(define-test color-map2
  (init-kb *map-color-kb*)

  (assert-equal '((colors-for map2 red blue green blue yellow))
                (ask '(colors-for map2 red blue green ?d ?e)))
  (assert-equal 2 (length (ask '(colors-for map2 red blue ?c ?d ?e))))
  (assert-equal 24 (length (ask '(colors-for map2 ?a ?b ?c ?d ?e))))
  (assert-equal nil (ask '(colors-for map2 red blue green yellow ?e)))
  )

(define-test color-map3
  (init-kb *map-color-kb*)

  (assert-equal '((colors-for map3 red blue green yellow green blue))
                (ask '(colors-for map3 red blue green yellow ?e ?f)))
  (assert-equal 1 (length (ask '(colors-for map3 red blue green ?d ?e ?f))))
  (assert-equal 24 (length (ask '(colors-for map3 ?a ?b ?c ?d ?e ?f))))
  (assert-equal nil (ask '(colors-for map3 red blue green blue ?e ?f)))
  )
;;shakey1.0


(define-test shakey-1 
  (init-kb *shakey-1-kb*)
  
  (assert-equal '(nil)
                (ask '(plan-for (v1-state room1 room1)
                                (v1-state ?1 room1)
                                ?actions)
                     '?actions))
  (assert-equal '((cons (push-box hall room1) nil))
                (ask '(plan-for (v1-state hall hall) 
                                (v1-state ?1 room1)
                                ?actions)
                     '?actions))
  (assert-equal '((cons (push-box room2 hall)
                      (cons (push-box hall room1) nil)))
                (ask '(plan-for (v1-state room2 room2) 
                                (v1-state ?1 room1)
                                ?actions)
                     '?actions))
  (assert-equal '((cons (move-to hall)
                      (cons (move-to room2)
                          (cons (push-box room2 hall)
                              (cons (push-box hall room1) nil)))))
                (ask '(plan-for (v1-state room1 room2) 
                                (v1-state ?1 room1)
                                ?actions)
                     '?actions))
  )

