;; expand-time.scm --

(declare (emit-import-library expand-time))

(module (expand-time)
    (the-func)
  (import (scheme)
    (chicken pretty-print))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-expand-time)))

  (define (the-func)
    'expand-time::the-func)

  (pretty-print 'evaluating-invoke-code-of-expand-time)
  #| end of module |# )

;;; end of file
