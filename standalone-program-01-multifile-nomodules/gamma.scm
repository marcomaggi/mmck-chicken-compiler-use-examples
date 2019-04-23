;; gamma.scm --

(declare (unit gamma)
	 (uses beta)
	 (uses delta))

(import (scheme)
  (chicken pretty-print))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-gamma)))

(define (gamma-func)
  (list 'gamma-func (delta-func) (beta-func)))

(pretty-print 'evaluating-invoke-code-of-gamma)

;;; end of file
