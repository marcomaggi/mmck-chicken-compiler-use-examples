;; program-using-beta-module-one.scm --
;;
;; This  file  is  one  of  the components  of  the  executable  program
;; "program-using-beta".  We declare this file  as a "unit", so that the
;; invoke code of "program-using-beta-module-one" is executed before the
;; one of "program-using-beta-module-main".  There is no need to declare
;; any uses.
;;
;; This  file defines  a single  module "program-using-beta-module-one",
;; which we  want to import  from other modules  in this program:  we do
;; need to emit the import library for this module.
;;
(declare (unit program-using-beta-module-one)
	 (emit-import-library program-using-beta-module-one))

(module (program-using-beta-module-one)
	(the-func)
	(import (scheme)
		(prefix module-beta-one beta-one::)
		(prefix module-beta-two beta-two::)
		(chicken syntax)
		(chicken pretty-print))
	(import-for-syntax (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-program-using-beta-module-one))

	(define (the-func)
	  (pretty-print (list 'program-using-beta-module-one::the-func
			      (beta-two::the-func)
			      (beta-one::the-func))))

	(pretty-print 'evaluating-invoke-code-of-program-using-beta-module-one)
	#| end of module |# )

;;; end of file
