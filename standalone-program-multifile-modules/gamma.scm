;; gamma.scm --

(declare (uses alpha)
	 (uses beta)
	 (uses delta))

(module (gamma)
    ()
  (import (scheme)
    (chicken pretty-print)
    (prefix alpha alpha::)
    (prefix beta  beta::)
    (prefix delta delta::))

  (define (the-func)
    (list 'gamma::the-func
	  (delta::the-func)
	  (beta::the-func)
	  (alpha::the-func)))

  (pretty-print 'evaluating-invoke-code-of-gamma)
  (pretty-print (the-func))
  #| end of module |# )

;;; end of file
