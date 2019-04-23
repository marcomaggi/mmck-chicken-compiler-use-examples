;; shared-library.scm --

(declare (unit shared-library)
	 (uses beta)
	 (uses delta)
	 (emit-import-library shared-library))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-shared-library)))

(module (shared-library)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix beta  beta::)
    (prefix beta1 beta1::)
    (prefix delta delta::)
    (prefix delta1 delta1::))

  (define (the-func)
    (list 'shared-library::the-func
	  (delta::the-func)
	  (delta1::the-func)
	  (beta::the-func)
	  (beta1::the-func)))

  (pretty-print 'evaluating-invoke-code-of-shared-library)
  #| end of module |# )

;;; end of file
