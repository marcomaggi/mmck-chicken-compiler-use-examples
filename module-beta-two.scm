;; module-beta-two.scm --
;;
;; This file is part of the  shared library "library-beta"; we link this
;; module along with  "module-beta-one".  We do *not*  declare this file
;; as a unit: this file is the main one.  We declare that this file uses
;; "module-beta-one": the  invoke code of "module-beta-one"  is executed
;; before the one of "module-beta-two".
;;
;; This file defines a single  module "module-beta-two" which we want to
;; import from  other libraries: we do  need to emit the  import library
;; for this module.
;;
(declare (uses module-beta-one)
	 (emit-import-library module-beta-two))

(module (module-beta-two)
	(the-func)
	(import (scheme)
		(chicken syntax)
		(chicken pretty-print)
		(prefix module-beta-one beta-one::)
		(prefix module-alpha    alpha::))
	(import-for-syntax (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-module-beta-two))

	(define (the-func)
	  (list 'module-beta-two::the-func
		(beta-one::the-func)
		(alpha::the-func)))

	(pretty-print 'evaluating-invoke-code-of-module-beta-two)

	#| end of module |# )

;;; end of file
