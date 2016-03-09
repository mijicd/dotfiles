;;; init.el --- The main configuration file.
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "src" user-emacs-directory))
(require 'init-elpa)

;;; load personal configuration
(require 'init-utils)
(require 'init-global-functions)
(require 'init-core)
(require 'init-gtags)
(require 'init-editing)
(require 'init-evil)
(require 'init-org)
(require 'init-maps)
(require 'init-python)
(require 'init-search)
(require 'init-web)
(require 'init-w3m)
(require 'init-powerline)
(require 'init-flycheck)

(provide 'init)
;;; init.el ends here
