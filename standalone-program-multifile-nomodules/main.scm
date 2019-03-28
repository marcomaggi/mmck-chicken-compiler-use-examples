;; main.scm --

(declare (uses gamma))

(import (scheme)
  (chicken pretty-print))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-main)))

(define (main)
  (list 'main (gamma-func)))

(pretty-print 'evaluating-invoke-code-of-main)
(pretty-print (main))

;;; end of file
