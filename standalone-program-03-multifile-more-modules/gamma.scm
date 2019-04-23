;; gamma.scm --

(declare (unit gamma)
	 (uses beta)
	 (uses delta)
	 (emit-import-library gamma))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-gamma)))

(module (gamma)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix beta  beta::)
    (prefix beta1 beta1::)
    (prefix delta delta::)
    (prefix delta1 delta1::))

  (define (the-func)
    (list 'gamma::the-func
	  (delta::the-func)
	  (delta1::the-func)
	  (beta::the-func)
	  (beta1::the-func)))

  (pretty-print 'evaluating-invoke-code-of-gamma)
  #| end of module |# )

;;; end of file
