;; delta.scm --

(declare (unit delta)
	 (uses alpha))

(import (scheme)
  (chicken pretty-print))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-delta)))

(define (delta-func)
  (list 'delta-func (alpha-func)))

(pretty-print 'evaluating-invoke-code-of-delta)

;;; end of file
