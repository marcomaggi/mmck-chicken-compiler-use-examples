;; delta.scm --

(declare (unit delta)
	 (uses beta)
	 (uses alpha))

(import (scheme)
  (chicken pretty-print))

(define (delta-func)
  (list 'delta-func (beta-func) (alpha-func)))

(pretty-print 'evaluating-invoke-code-of-delta)

;;; end of file
