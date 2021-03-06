;; main.scm --

(require-library shared-library)

(import (scheme)
  (chicken pretty-print))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-main)))

(define (main)
  (list 'main
	(alpha-func)
	(beta-func)
	(delta-func)
	(gamma-func)))

(pretty-print 'evaluating-invoke-code-of-main)
(pretty-print (main))

;;; end of file
