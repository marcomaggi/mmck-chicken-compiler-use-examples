;; module-beta-one.scm --
;;
;; This file is part of the  shared library "library-beta"; we link this
;; module  along with  "module-beta-two".   We declare  this  file as  a
;; "unit",  so that  the invoke  code of  "module-beta-one" is  executed
;; before the one of "module-beta-two".
;;
;; This file defines a single  module "module-beta-one" which we want to
;; import from the other module and  other libraries: we do need to emit
;; the import library for this module.
;;
(declare (unit module-beta-one)
	 (emit-import-library module-beta-one))

(module (module-beta-one)
	(the-func)
	(import (scheme)
		(chicken syntax)
		(chicken pretty-print)
		(prefix module-alpha alpha::))
	(import-for-syntax (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-module-beta-one))

	(define (the-func)
	  (list 'module-beta-one::the-func
		(alpha::the-func)))

	(pretty-print 'evaluating-invoke-code-of-module-beta-one)
	#| end of module |# )

;;; end of file
