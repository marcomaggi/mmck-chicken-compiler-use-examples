;; module-for-expand.scm --
;;
;; This  file is  the single  component of  the shared  library "library-for-expand";
;; there is neither the need to declare a "unit", nor to declare any "uses".
;;
;; This file  defines a single  module "module-for-expand",  which we want  to import
;; from other libraries: we do need to emit the import library for this module.
;;
(declare (emit-import-library module-for-expand))

(module (module-for-expand)
    (the-func)
  (import (scheme)
    (chicken syntax)
    (chicken pretty-print))
  (import-for-syntax (chicken pretty-print))

  (begin-for-syntax
   (pretty-print 'evaluating-expand-time-code-of-module-for-expand))

  (define (the-func)
    'module-for-expand::the-func)

  (pretty-print 'evaluating-invoke-code-of-module-for-expand)
  #| end of module |# )

;;; end of file
