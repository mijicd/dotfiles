;;; "root" configuration file

(add-to-list 'load-path (expand-file-name "src" user-emacs-directory))
(require 'init-elpa)

;; essential settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq visible-bell nil)
(setq custom-safe-themes t)
(put 'narrow-to-region 'disabled nil)

(defun my-minibuffer-setup-hook ()
  "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 1000000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;;; remap file types
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))

;;; load personal configuration
(require 'init-utils)
(require 'init-global-functions)
(require 'diminish)
(require 'bind-key)
(require 'init-gtags)
(require 'init-evil)
(require 'init-org)
(require 'init-maps)
(require 'init-w3m)
(require 'init-powerline)
(require 'init-flycheck)

;; Org prerequisites
(use-package visual-fill-column
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package elpy
  :ensure t)

(use-package rainbow-mode
  :ensure t)

(use-package css-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook (lambda ()
                             (rainbow-mode))))

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t))

(use-package wgrep-ag
  :ensure t
  :commands (wgrep-ag-setup))

(use-package ag
  :ensure t
  :defer t
  :config
  (add-hook 'ag-mode-hook
            (lambda ()
              (wgrep-ag-setup)
              (define-key ag-mode-map (kbd "n") 'evil-search-next)
              (define-key ag-mode-map (kbd "N") 'evil-search-previous)))
  (setq ag-executable "/usr/local/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t))

(use-package exec-path-from-shell
  :ensure t
  :defer t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))

(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package swiper
  :ensure t
  :commands swiper
  :bind ("C-s" . swiper))

(use-package dictionary :ensure t)
(use-package emmet-mode :ensure t)
(use-package flycheck :ensure t)
(use-package helm-projectile
  :commands (helm-projectile helm-projectile-switch-project)
  :ensure t)

(use-package markdown-mode
  :bind (("C-\\" . markdown-insert-list-item)
         ("C-c '" . fence-edit-code-at-point)
         ("C-c 1" . markdown-insert-header-atx-1)
         ("C-c 2" . markdown-insert-header-atx-2)
         ("C-c 3" . markdown-insert-header-atx-3)
         ("C-c 4" . markdown-insert-header-atx-4)
         ("C-c 5" . markdown-insert-header-atx-5)
         ("C-c 6" . markdown-insert-header-atx-6))
  :ensure t)

(use-package web-mode
  :ensure t
  :defer t
  :config
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2))

(use-package mmm-mode :ensure t :defer t)
(use-package yaml-mode :ensure t :defer t)

(use-package yasnippet
  :ensure t
  :defer t
  :config
  (yas-reload-all)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/remote-snippets"))
  (setq tab-always-indent 'complete)
  (setq yas-prompt-functions '(yas-completing-prompt
                               yas-ido-prompt
                               yas-dropdown-prompt))
  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))

(use-package which-key
  :ensure t
  :diminish ""
  :config
  (which-key-mode t))

(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package highlight-symbol
  :ensure t
  :defer t
  :diminish ""
  :config
  (setq-default highlight-symbol-idle-delay 1.5))

(use-package magit
  :ensure t
  :defer t
  :config
  (setq magit-branch-arguments nil)
  (setq magit-push-always-verify nil)
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package mmm-mode
  :ensure t
  :defer t
  :config
  (setq mmm-global-mode 'maybe)
  (mmm-add-classes
   '((markdown-cl
      :submode emacs-lisp-mode
      :face mmm-declaration-submode-face
      :front "^~~~cl[\n\r]+"
      :back "^~~~$")
     (markdown-php
      :submode php-mode
      :face mmm-declaration-submode-face
      :front "^```php[\n\r]+"
      :back "^```$")))
  (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-cl)
  (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-php))

(defvar show-paren-delay 0
  "Delay (in seconds) before matching paren is highlighted.")

;;; various hooks
(add-hook 'flycheck-mode-hook
          (lambda ()
            (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
            (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previous-error)))

(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (define-key lisp-interaction-mode-map (kbd "<C-return>") 'eval-last-sexp)))

(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd ",o") 'delete-other-windows)))

(add-hook 'git-commit-mode-hook 'evil-insert-state)

(add-hook 'emmet-mode-hook
          (lambda ()
            (evil-define-key 'insert emmet-mode-keymap (kbd "C-S-l") 'emmet-next-edit-point)
            (evil-define-key 'insert emmet-mode-keymap (kbd "C-S-h") 'emmet-prev-edit-point)))

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-style-padding 2)
            (yas-minor-mode t)
            (emmet-mode)
            (flycheck-add-mode 'html-tidy 'web-mode)
            (flycheck-mode)))

(setq web-mode-ac-sources-alist
      '(("php" . (ac-source-php-extras ac-source-yasnippet ac-source-gtags ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
        ("css" . (ac-source-css-property ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))))

(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil)))))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (yas-minor-mode t)
            (eldoc-mode)
            (highlight-symbol-mode)
            (define-key emacs-lisp-mode-map (kbd "<C-return>") 'eval-last-sexp)))

(add-hook 'sh-mode-hook (lambda ()
                          (setq sh-basic-offset 2)
                          (setq sh-indentation 2)))

(add-hook 'javascript-mode-hook (lambda ()
                                  (set-fill-column 120)
                                  (turn-on-auto-fill)
                                  (setq js-indent-level 2)))

(add-hook 'markdown-mode-hook (lambda ()
                                (set-fill-column 80)
                                (turn-on-auto-fill)
                                (flyspell-mode)))

(add-hook 'html-mode-hook (lambda ()
                            (setq sgml-basic-offset 2)
                            (setq indent-tabs-mode nil)))

(put 'narrow-to-region 'disabled nil)
(diminish 'undo-tree-mode)
(require 'init-linum)

;;; sRGB doesn't blend with Powerline's pixmap colors, but is only
;;; used in OS X. Disable sRGB before setting up Powerline.
(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

;; UI
(use-package zenburn-theme :ensure t :defer t)

(load-theme 'zenburn)

(if (eq system-type 'darwin)
    (set-frame-font "Monaco-14"))

(provide 'init)
