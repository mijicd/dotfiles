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

(use-package dictionary :ensure t)
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

(use-package yaml-mode :ensure t :defer t)
(use-package rainbow-mode :ensure t)

(defvar show-paren-delay 0
  "Delay (in seconds) before matching paren is highlighted.")

(use-package highlight-symbol
  :ensure t
  :defer t
  :diminish ""
  :config
  (setq-default highlight-symbol-idle-delay 1.5))

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

(add-hook 'markdown-mode-hook (lambda ()
                                (set-fill-column 80)
                                (turn-on-auto-fill)
                                (flyspell-mode)))

(put 'narrow-to-region 'disabled nil)
(diminish 'undo-tree-mode)
(require 'init-linum)

(provide 'init-editing)
