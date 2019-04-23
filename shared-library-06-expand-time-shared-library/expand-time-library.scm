;; expand-time-library.scm --

(declare (unit expand-time-library)
	 (emit-import-library expand-time-library))

(module (expand-time-library)
    (the-func)
  (import (scheme)
    (chicken pretty-print))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-expand-time-library)))

  (define (the-func)
    'expand-time-library::the-func)

  (pretty-print 'evaluating-invoke-code-of-expand-time-library)
  #| end of module |# )

;;; end of file
