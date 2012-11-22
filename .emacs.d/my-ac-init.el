;;(require 'auto-complete)
(require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
(setq ac-use-quick-help nil)
(setq ac-ignore-case nil)
(setq ac-auto-show-menu 0.5)
(global-auto-complete-mode t)

; (setq ac-auto-start nil);;disable doing auto complete
; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  (kbd "M-n") 'auto-complete)
(global-set-key "\M-n>" 'auto-complete)
; (ac-set-trigger-key "TAB")

(defun ac-complete-clang-self-insert (arg)
  (interactive "p")
  (self-insert-command arg)
  (ac-complete-clang))
;;if want to use clang completion uncommented these lines
; (require 'auto-complete-clang)
(defun my-ac-clang-setup ()
  (setq ac-sources
        '(;ac-source-clang
          ac-source-yasnippet
                                        ; ac-source-symbols
          ;; ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ;; ac-source-imenu
          ac-source-files-in-current-dir
          ac-source-filename))
  ; (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
  ; These can speed up member completion while ac-sources is controlled
  ; by ac-auto-show-menu setting
  (local-set-key "." 'ac-complete-clang-self-insert) 
  (local-set-key ">" 'ac-complete-clang-self-insert)
  (local-set-key ":" 'ac-complete-clang-self-insert)
  )

; (add-hook 'c-mode-common-hook 'my-ac-clang-setup)
;;;(require 'auto-complete-clang-async)
;;;(defun ac-cc-mode-setup ()
;;;  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
;;;  (setq ac-sources (append '(ac-source-clang-async) ac-sources))
;;;  (ac-clang-launch-completion-process)
;;;)
;;;(defun my-ac-config ()
;;;  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;;  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;;  )
;;;(my-ac-config)

;;if want to use semantic for members completion, uncommented follow lines
;;and disable auto-complete-clang
;;;;C-mode auto complete members
(defun ac-complete-semantic-self-insert (arg)
  (interactive "p")
  (self-insert-command arg)
  (ac-complete-semantic))
(defun my-ac-semantic-hook () 
  (setq ac-sources
        '(;ac-source-semantic
           ac-source-yasnippet
           ; ac-source-yasnippet
           ; ac-source-symbols
           ;; ac-source-semantic
           ac-source-abbrev
           ac-source-words-in-buffer
           ac-source-words-in-all-buffer
           ;; ac-source-imenu
           ac-source-files-in-current-dir
           ac-source-filename))
  ; (setq ac-sources (append '(ac-source-semantic ac-source-yasnippet) ac-sources))
  ; These can speed up member completion while ac-sources is controlled
  ; by ac-auto-show-menu setting
  (local-set-key "." 'ac-complete-semantic-self-insert) 
  (local-set-key ">" 'ac-complete-semantic-self-insert)
  (local-set-key ":" 'ac-complete-semantic-self-insert)
  )
;;;(add-hook 'c-mode-common-hook 'my-c-mode-ac-complete-hook)

(defun my-member-completion-setup()
  (if enable-clang-completion
    ;;clang completion setting
    (progn
      (message "xyf ac clang setting")
      (require 'auto-complete-clang)
      (add-hook 'c-mode-common-hook 'my-ac-clang-setup)
      )
    ;;semantic completion setting
    (progn
      (message "xyf ac semantic setting")
      (add-hook 'c-mode-common-hook 'my-ac-semantic-hook))))
(my-member-completion-setup)

(setq ac-use-menu-map t)
;; Default settings
;;In vimpulse to get it same to vim behave
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(defun my-ac-stop ()
 (interactive)
 ;;(message "my-ac-stop")
 (evil-normal-state)
 (ac-stop)
 )
;(define-key ac-menu-map "\C-[" 'ac-stop)
(define-key ac-menu-map "\C-[" 'my-ac-stop)
(define-key ac-menu-map (kbd "ESC") 'my-ac-stop)



