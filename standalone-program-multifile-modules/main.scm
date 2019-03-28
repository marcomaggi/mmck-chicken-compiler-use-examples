;; gamma.scm --

(declare (uses gamma))

(begin
  (import (chicken syntax))
  (import-for-syntax (chicken pretty-print))
  (begin-for-syntax
    (pretty-print 'evaluating-visit-code-of-main)))

(module (main)
    ()
  (import (scheme)
    (chicken pretty-print)
    (prefix gamma gamma::))

  (define (the-func)
    (list 'main::the-func
	  (gamma::the-func)))

  (pretty-print 'evaluating-invoke-code-of-main)
  (pretty-print (the-func))
  #| end of module |# )

;;; end of file
