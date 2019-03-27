;; gamma.scm --

(declare (uses alpha)
	 (uses beta)
	 (uses delta))

(import (scheme)
  (chicken pretty-print))

(define (gamma-func)
  (list 'gamma-func (delta-func) (beta-func) (alpha-func)))

(pretty-print 'evaluating-invoke-code-of-gamma)
(pretty-print (gamma-func))

;;; end of file
