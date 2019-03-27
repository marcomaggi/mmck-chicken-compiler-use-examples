;; program-using-alpha-module-main.scm --
;;
;; This  file  is  the  single   component  of  the  executable  program
;; "program-using-alpha".   There is  neither  the need  to declare  any
;; "unit", nor to declare any "uses".
;;
;; To keep the namespace clean: this file defines a single module "main"
;; which exports  no syntactic  bindings; there  is no  need to  emit an
;; import library for this module.

(module (main)
	()
	(import (scheme)
		(prefix module-alpha alpha::)
		(chicken pretty-print))

	(define (main)
	  (pretty-print (list 'program-using-alpha::main
			      (alpha::the-func))))

	(main)
	#| end of module |# )

;;; end of file
