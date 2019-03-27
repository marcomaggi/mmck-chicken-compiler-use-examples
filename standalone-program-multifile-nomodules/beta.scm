;; beta.scm --

(declare (unit beta)
	 (uses alpha))

(import (scheme)
  (chicken pretty-print))

(define (beta-func)
  (list 'beta-func (alpha-func)))

(pretty-print 'evaluating-invoke-code-of-beta)

;;; end of file
