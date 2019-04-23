;; main.scm --

(require-library shared-library)

(module (main)
    ()
  (import (scheme)
    (chicken pretty-print)
    (prefix (alpha) alpha::)
    (prefix (beta) beta::)
    (prefix (delta) delta::)
    (prefix (shared-library) shared-library::))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-main)))

  (define (main)
    (list 'main
	  (alpha::the-func)
	  (beta::the-func)
	  (delta::the-func)
	  (shared-library::the-func)))

  (pretty-print 'evaluating-invoke-code-of-main)
  (pretty-print (main))
  #| end of module |# )

;;; end of file
