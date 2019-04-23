;; run-time-library.scm --

(declare (unit run-time-library)
	 (emit-import-library run-time-library))

(require-library expand-time-library)

(module (run-time-library)
    (the-func (syntax: the-macro))
  (import (scheme)
    (chicken pretty-print))
  (import-for-syntax (prefix expand-time-library expand-time-library::))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-run-time-library)))

  (define-syntax the-macro
    (ir-macro-transformer
     (lambda (form inject compare?)
       (let ((thing (expand-time-library::the-func)))
	 `(list 'run-time-library::the-macro (quote ,thing))))))

  (define (the-func)
    'run-time-library::the-func)

  (pretty-print 'evaluating-invoke-code-of-run-time-library)
  #| end of module |# )

;;; end of file
