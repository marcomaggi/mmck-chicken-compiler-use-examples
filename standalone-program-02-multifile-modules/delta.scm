;; delta.scm --

(declare (unit delta)
	 (uses alpha)
	 (emit-import-library delta))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-delta)))

(module (delta)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::))

  (define (the-func)
    (list 'delta::the-func (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-delta)
  #| end of file |# )

;;; end of file
