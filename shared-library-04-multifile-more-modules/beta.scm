;; beta.scm --

(declare (unit beta)
	 (uses alpha)
	 (emit-import-library beta)
	 (emit-import-library beta1))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-beta)))

(module (beta1)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::))

  (define (the-func)
    (list 'beta1::the-func (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-beta1)
  #| end of module |# )

(module (beta)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::)
    (prefix beta1 beta1::))

  (define (the-func)
    (list 'beta::the-func
	  (beta1::the-func)
	  (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-beta)
  #| end of module |# )

;;; end of file
