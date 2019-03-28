;; alpha.scm --

(declare (unit alpha)
	 (uses))

(import (scheme)
  (chicken pretty-print))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-alpha)))

(define (alpha-func)
  'alpha-func)

(pretty-print 'evaluating-invoke-code-of-alpha)

;;; end of file
