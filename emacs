(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (spacemacs-theme tide expand-region ace-mc jedi dired-subtree smex))))
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

;; These two settings are specific to MacOS
;; Comment/uncomment appropriately
(setq ALT 'meta)
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'control)


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

;; Support for expanding the selected region incrementally
(global-set-key (kbd "C-@") 'er/expand-region)

;; Typescript interactive development support
;; tide setup
(require 'tide)
(defun setup-tide-mode ()
  "Set up tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1))
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
;;; end tide setup

(defun new-js-if ()
  (interactive)
  (insert "if () {\n"
	  "} else {\n"
	  "}")
  (forward-line -2)
  (forward-char 5))

p(defun new-ng-input ()
   (interactive)
   (insert "@Input some_variable: any;")
   (forward-char -18)
   (call-interactively (key-binding (kbd "C-@")))
   (call-interactively (key-binding (kbd "C-@"))))

(defun new-ng-output ()
  (interactive)
  (insert "@Output some_variable = new EventEmitter();")
  (forward-char -25)
  (call-interactively (key-binding (kbd "C-@")))
  (call-interactively (key-binding (kbd "C-@"))))

(defun new-ng-form ()
  (interactive)
  (insert "<!-- Ensure that app.module.ts has imported FormsModule from '@angular/forms' -->\n"
	  "<form #mediaItemForm=\"ngForm\" (onSubmit)=\"mediaItemForm.value\">\n"
	  "  <ul>\n"
	  "    <li>\n"
	  "      <label for=\"medium\">Medium</label>\n"
	  "      <select name=\"medium\" id=\"medium\">\n"
	  "        <option value=\"Movies\">Movies</option>\n"
	  "        <option value=\"Series\">Series</option>\n"
	  "      </select>\n"
	  "    </li>\n"
	  "    <li>\n"
	  "      <label for=\"name\">Name</label>\n"
	  "      <input type=\"text\" name=\"name\" id=\"name\">\n"
	  "    </li>\n"
	  "    <li>\n"
	  "      <label for=\"category\">Category</label>\n"
	  "      <select name=\"category\" id=\"category\">\n"
	  "        <option value=\"Action\">Action</option>\n"
	  "        <option value=\"Science Fiction\">Science Fiction</option>\n"
	  "        <option value=\"Comedy\">Comedy</option>\n"
	  "        <option value=\"Drama\">Drama</option>\n"
	  "        <option value=\"Horror\">Horror</option>\n"
	  "        <option value=\"Romance\">Romance</option>\n"
	  "      </select>\n"
	  "    </li>\n"
	  "    <li>\n"
	  "      <label for=\"year\">Year</label>\n"
	  "      <input type=\"text\" name=\"year\" id=\"year\" maxlength=\"4\">\n"
	  "    </li>\n"
	  "  </ul>\n"
	  "  <button type=\"submit\">Save</button>\n"
	  "</form>\n"
	  )
  (forward-char -25))
