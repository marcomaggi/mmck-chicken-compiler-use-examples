;; beta.scm --

(declare (unit beta)
	 (uses alpha)
	 (emit-import-library beta))

(module (beta)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix (alpha) alpha::))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-beta)))

  (define (the-func)
    (list 'beta::the-func (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-beta)
  #| end of module |# )

;;; end of file
