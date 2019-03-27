;; program-using-beta-module-main.scm --
;;
;; This file is one of the components of the executable program "program-using-beta".
;; This is the main module: there is no  need to declare any "unit".  We declare that
;; this   file    uses   "program-using-beta-module-one":   the   invoke    code   of
;; "program-using-beta-module-one" is executed before the one of "main".
;;
;; To  keep the  namespace clean:  this  file defines  a single  module "main"  which
;; exports no syntactic bindings; there is no need to emit an import library for this
;; module.

(declare (uses program-using-beta-module-one))

(module (main)
    ()
  (import (scheme)
    (prefix (program-using-beta-module-one) one::)
    (prefix module-beta-one beta-one::)
    (prefix module-beta-two beta-two::)
    (chicken syntax)
    (chicken pretty-print))
  (import-for-syntax (chicken pretty-print))

  (begin-for-syntax
   (pretty-print 'evaluating-expand-time-code-of-program-using-beta-module-main))

  (define (main)
    (pretty-print (list 'program-using-beta-module-main::main
			(one::the-func)
			(beta-two::the-func)
			(beta-one::the-func))))

  (main)
  #| end of module |# )

;;; end of file
