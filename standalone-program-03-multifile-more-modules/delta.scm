;; delta.scm --

(declare (unit delta)
	 (uses alpha)
	 (emit-import-library delta)
	 (emit-import-library delta1))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-delta)))

(module (delta1)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::))

  (define (the-func)
    (list 'delta1::the-func (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-delta1)
  #| end of file |# )

(module (delta)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::)
    (prefix delta1 delta1::))

  (define (the-func)
    (list 'delta::the-func
	  (delta1::the-func)
	  (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-delta)
  #| end of file |# )

;;; end of file
