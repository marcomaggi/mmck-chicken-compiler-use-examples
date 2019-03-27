;; alpha.scm --

(declare (unit alpha)
	 (emit-import-library alpha))

(module (alpha)
    (the-func)
  (import (scheme)
    (chicken pretty-print))

  (define (the-func)
    'alpha::the-func)

  (pretty-print 'evaluating-invoke-code-of-alpha)

  #| end of module |# )

;;; end of file
