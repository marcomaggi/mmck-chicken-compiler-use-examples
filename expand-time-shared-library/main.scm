;; main.scm --

(require-library run-time-library)

(module (main)
    ()
  (import (scheme)
    (chicken pretty-print)
    (prefix run-time run-time::))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-main)))

  (define (main)
    (list 'main
	  (run-time::the-func)
	  (run-time::the-macro)))

  (pretty-print 'evaluating-invoke-code-of-main)
  (pretty-print (main))
  #| end of module |# )

;;; end of file
