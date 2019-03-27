;; module-alpha.scm --
;;
;; This   file  is   the  single   component  of   the  shared   library
;; "library-alpha"; there is  neither the need to declare  a "unit", nor
;; to declare any "uses".
;;
;; This file  defines a single  module "module-alpha", which we  want to
;; import from  other libraries: we do  need to emit the  import library
;; for this module.
;;
(declare (emit-import-library module-alpha))

(module (module-alpha)
	(the-func (syntax: the-macro))
	(import (scheme)
		(procedural-macros)
		(chicken syntax)
		(chicken pretty-print))
	;;Import   "module-for-expand"   in  the   expand-time   lexical
	;;environment: its exported syntactic  bindings are available in
	;;the body of macro transformers.
	;;
	(import-for-syntax (prefix module-for-expand expand::)
			   (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-module-alpha))

	(define-syntax the-macro
	  (ir-macro-transformer
	     (lambda (form inject compare?)
	       (let ((thing (expand::the-func)))
		 `(list 'module-alpha::the-macro (quote ,thing))))))

	(define (the-func)
	  (list 'module-alpha::the-func (the-macro)))

	(pretty-print 'evaluating-invoke-code-of-module-alpha)
	#| end of module |# )

;;; end of file
