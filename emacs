(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages (quote (ace-mc jedi dired-subtree smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'exec-path "/usr/local/bin")
(set-keyboard-coding-system nil)
(global-set-key (kbd "M-x") 'smex)
(require 'dired-subtree)
(define-key dired-mode-map "i" 'dired-subtree-insert)
(define-key dired-mode-map ";" 'dired-subtree-remove)
(global-auto-revert-mode t)
(setq shell-command-switch "-ic")
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
(setq make-backup-files nil)

;; Additional keybinding for easy line duplication
(defun duplicate-line ()
  "Duplicates the current line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-d") 'duplicate-line)

;; I use Mac and have switched (natively) which
;; button acts as the 'Command' button
(setq mac-command-modifier 'control)

;; Python code completion
(add-hook 'python-mode-hook 'jedi:setup)

;; Show line numbers on all files
(global-display-line-numbers-mode)

;; Support for multiple cursors
(require 'ace-mc)
(global-set-key (kbd "C-)") 'ace-mc-add-multiple-cursors)

;; Support for switching the cursor to previous window
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))
