;; beta.scm --

(declare (unit beta)
	 (uses alpha))

(import (scheme)
  (chicken pretty-print))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-beta)))

(define (beta-func)
  (list 'beta-func (alpha-func)))

(pretty-print 'evaluating-invoke-code-of-beta)

;;; end of file
