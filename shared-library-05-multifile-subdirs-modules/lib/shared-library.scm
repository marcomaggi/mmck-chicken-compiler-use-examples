;; shared-library.scm --

(declare (unit shared-library)
	 (uses beta)
	 (uses delta)
	 (emit-import-library shared-library))

(module (shared-library)
    (the-func)
  (import (scheme)
    (chicken pretty-print)
    (prefix (beta) beta::)
    (prefix (delta) delta::))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-shared-library)))

  (define (the-func)
    (list 'shared-library::the-func (delta::the-func) (beta::the-func)))

  (pretty-print 'evaluating-invoke-code-of-shared-library)
  #| end of module |# )

;;; end of file
