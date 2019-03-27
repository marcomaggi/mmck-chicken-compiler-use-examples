;; delta.scm --

(declare (unit delta)
	 (uses beta)
	 (uses alpha)
	 (emit-import-library delta))

(module (delta)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::)
    (prefix beta  beta::))

  (define (the-func)
    (list 'delta::the-func (beta::the-func) (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-delta)
  #| end of file |# )

;;; end of file
