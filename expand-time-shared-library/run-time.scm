;; expand-time.scm --

(declare (emit-import-library run-time))

(module (run-time)
    (the-func (syntax: the-macro))
  (import (scheme)
    (chicken pretty-print))
  (import-for-syntax (prefix expand-time expand-time::))

  (begin
    (import (chicken syntax))
    (import-for-syntax (chicken pretty-print))
    (begin-for-syntax
      (pretty-print 'evaluating-visit-code-of-run-time)))

  (define-syntax the-macro
    (ir-macro-transformer
     (lambda (form inject compare?)
       (let ((thing (expand-time::the-func)))
	 `(list 'run-time::the-macro (quote ,thing))))))

  (define (the-func)
    'run-time::the-func)

  (pretty-print 'evaluating-invoke-code-of-run-time)
  #| end of module |# )

;;; end of file
