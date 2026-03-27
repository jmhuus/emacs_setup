;;; init.el --- Emacs configuration
;;; Commentary:
;;; A cleaned and organized Emacs initialization file.

;;; Code:

;; =============================================================================
;; 1. Early Initialization & Package Management
;; =============================================================================
;; Add MELPA to package archives and initialize
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; It's often better to let `package-activate-all` handle this after bootstrapping.
;; (package-initialize) 

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load use-package and set it to always ensure packages are installed
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; =============================================================================
;; 2. Basic Emacs Settings & UI
;; =============================================================================

;; By default, don't show dired file details
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Disable the startup screen.
(setq inhibit-startup-screen t)

;; Hide the menu bar.
(menu-bar-mode -1)

;; Hide the scroll bar.
(scroll-bar-mode -1)

;; Disable the graphical tool bar.
(tool-bar-mode -1)

;; Show the current column number in the mode line.
(column-number-mode t)

;; Disable Emacs' bell noise.
(setq ring-bell-function 'ignore)

;; Show line numbers in all buffers globally.
(global-display-line-numbers-mode 1)

;; Disable backup files
(setq make-backup-files nil)

;; Automatically close pairs like parentheses.
(electric-pair-mode 1)

;; Automatically revert buffers when files change on disk
(global-auto-revert-mode t)

;; Enable undo/redo for window configurations (C-c left/right)
(winner-mode 1)

;; Set the Spacemacs Dark theme. Ensure 'spacemacs-theme' package is installed.
(load-theme 'spacemacs-dark t)

;; Set the default starting directory for find-file (C-x C-f)
(setq default-directory "~/Documents/engineering/computer_engineering/")

;; Open a shell in the current window instead of a new one
(add-to-list 'display-buffer-alist '("\\*shell\\*" . (display-buffer-same-window)))

;; ;; --- Reset modifiers on focus change to prevent "stuck keys" ---
;; (defun reset-modifiers-on-focus-change ()
;;   "Reset keyboard modifiers when Emacs frame loses focus."
;;   (when (not (frame-focus-state)) ;; Only act when Emacs loses focus
;;     (keyboard-quit)))

;; (add-function :after after-focus-change-function #'reset-modifiers-on-focus-change)



;; =============================================================================
;; Package Configurations (using use-package)
;; =============================================================================

;; --- Smex for enhanced M-x ---
(use-package smex
  :bind (("M-x" . smex)))

;; --- Dired Subtree for directory navigation ---
(use-package dired-subtree
  :after dired
  :bind (:map dired-mode-map
              ("i" . dired-subtree-insert)
              (";" . dired-subtree-remove)))

;; --- Yasnippet for code snippets ---
(use-package yasnippet
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet)

;; --- Magit for Git integration ---
(use-package magit
  :bind ("C-x g" . magit-status))

;; --- Org Mode Enhancements ---
(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

;; --- Expand Region ---
(use-package expand-region
  :bind (("C-j" . er/expand-region)))


;; =============================================================================
;; Language Server Protocol (LSP) and Autocompletion
;; For consistency, this example uses the eglot/company setup for Python as well.
;; =============================================================================

;; --- Company for autocompletion ---
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.2))

;; --- Flycheck for on-the-fly syntax checking ---
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;; --- Eglot (LSP client) ---
;; Eglot is configured to automatically use Flycheck when it is enabled globally.
(use-package eglot
  :hook ((python-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure))
  :config
  ;; Add language server configurations
  (add-to-list 'eglot-server-programs
               '(python-mode . ("~/.emacs.d/.venv/bin/pylsp")))
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd"))))


;; =============================================================================
;; Custom Functions & Keybindings
;; =============================================================================


;; --- Duplicate Line ---
(defun duplicate-line ()
  "Duplicate the current line."
  (interactive)
  (let ((text (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (save-excursion
      (goto-char (line-end-position))
      (insert "\n" text))))

(global-set-key (kbd "C-d") #'duplicate-line)

;; --- Cycle backwards through windows ---
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))


;; =============================================================================
;; Session and History Management
;; =============================================================================

;; recentf-mode: Track recently opened files and persist history.
(use-package recentf
  :bind (("C-c f" . recentf-open-files))
  :config
  (setq recentf-save-file (expand-file-name ".recentf" user-emacs-directory))
  (recentf-mode 1))

;; Remember the cursor position in every file.
(save-place-mode 1)

;; =============================================================================
;; END OF INIT.EL
;; =============================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" default))
 '(package-selected-packages
   '(csv-mode flycheck vterm yasnippet-snippets typescript-mode spacemacs-theme smex org-bullets magit lsp-ui lsp-pyright expand-region eglot dired-subtree company cmake-mode bazel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; =================== End of autogenerated ==================

;; Re-enable some disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; Final message to confirm loading
(message "Custom init.el loaded successfully.")

;;; init.el ends here
