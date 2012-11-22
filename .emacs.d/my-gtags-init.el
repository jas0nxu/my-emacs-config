(autoload 'gtags-mode "gtags" "" t)

;;auto update gtags database
(add-hook 'after-save-hook 'my-update-tags)

(setq gtags-mode-hook
      '(lambda ()
           (setq gtags-path-style 'relative)))

(setq gtags-select-buffer-single t) 

(add-hook 'c-mode-hook
          '(lambda ()
               (gtags-mode 1)
               ))

(defun kill-all-gtags-select-buffers()
    "Kill all gtags select buffers."
    (interactive)
    (save-excursion
        (let((count 0))
            (dolist(buffer (buffer-list))
                (set-buffer buffer)
                (when (equal major-mode 'gtags-select-mode)
                    (setq count (1+ count))
                    (kill-buffer buffer)))
            (message "Killed %i gtags select buffer(s)." count ))))

;;There are two hooks, gtags-mode-hook and gtags-select-mode-hook.
;;The usage of the hook is shown as follows.
;;
;;[Setting to use vi style scroll key]
(add-hook 'gtags-mode-hook
          '(lambda ()
               (define-key gtags-mode-map "\C-f" 'scroll-up)
               (define-key gtags-mode-map "\C-b" 'scroll-down)
               ))

;;;[Setting to make 'Gtags select mode' easy to see]
(add-hook 'gtags-select-mode-hook
          '(lambda ()
               (setq hl-line-face 'underline)
               (hl-line-mode 1)
               ))

;;gtags key map in evil 
(define-key evil-normal-state-map (kbd ",gg") 'gtags-find-tag-from-here)
(define-key evil-normal-state-map [(f8)] 'gtags-find-tag-from-here)
(define-key evil-normal-state-map (kbd ",gd") 'gtags-find-tag)
(define-key evil-normal-state-map (kbd ",gc") 'gtags-find-rtag)
(define-key evil-normal-state-map (kbd "\C-t") 'gtags-pop-stack)
(define-key evil-normal-state-map [(f7)] 'gtags-pop-stack)
(define-key evil-normal-state-map (kbd ",j") 'gtags-select-tag)
(define-key evil-normal-state-map (kbd ",k") 'kill-all-gtags-select-buffers)

(add-hook 'gtags-select-mode-hook
          (lambda ()
              (define-key evil-normal-state-local-map "\r" 'gtags-select-tag)
              (define-key evil-normal-state-local-map (kbd "\C-f") 'scroll-up)
              (define-key evil-normal-state-local-map (kbd "\C-b") 'scroll-down)
              (define-key evil-normal-state-local-map (kbd "j") 'next-line)
              (define-key evil-normal-state-local-map (kbd "k") 'previous-line)
              (define-key evil-normal-state-local-map (kbd "\C-n") 'next-line)
              (define-key evil-normal-state-local-map (kbd "\C-p") 'previous-line)
              (define-key evil-normal-state-local-map (kbd "RET") 'gtags-select-tag)
              (define-key evil-normal-state-local-map (kbd "\C-t") 'gtags-pop-stack)
              (define-key evil-normal-state-local-map (kbd "q") 'kill-buffer-and-window)
              ))

;;gtags key map in viper
;;;(define-key viper-vi-global-user-map (kbd ",gg") 'gtags-find-tag-from-here)
;;;(define-key viper-vi-global-user-map (kbd ",gd") 'gtags-find-tag)
;;;(define-key viper-vi-global-user-map (kbd ",gc") 'gtags-find-rtag)
;;;(define-key viper-vi-global-user-map (kbd ",p") 'gtags-pop-stack)
;;;(define-key viper-vi-global-user-map (kbd ",j") 'gtags-select-tag)
;;;(define-key viper-vi-global-user-map (kbd ",k") 'kill-all-gtags-select-buffers)
;;;(add-hook 'gtags-mode-hook
;;;          (lambda ()
;;;            (local-set-key (kbd "\C-f") 'scroll-up)
;;;            (local-set-key (kbd "\C-b") 'scroll-down)
;;;            (local-set-key (kbd ",gd") 'gtags-find-tag)
;;;            (local-set-key (kbd ",gc") 'gtags-find-rtag)
;;;            (local-set-key (kbd ",p") 'gtags-pop-stack)
;;;            (local-set-key (kbd ",bd") 'kill-buffer-and-window)
;;;            ))
;;;;(define-key gtags-select-mode-map (kbd ",") 'leader-map)  
;;;(add-hook 'gtags-select-mode-hook
;;;          (lambda ()
;;;            (local-set-key "\r" 'gtags-select-tag)
;;;            (local-set-key (kbd "\C-f") 'scroll-up)
;;;            (local-set-key (kbd "\C-b") 'scroll-down)
;;;            (local-set-key (kbd "j") 'next-line)
;;;            (local-set-key (kbd "k") 'previous-line)
;;;            (local-set-key (kbd ",j") 'gtags-select-tag)
;;;            (local-set-key (kbd ",p") 'gtags-pop-stack)
;;;            (local-set-key (kbd ",bd") 'kill-buffer-and-window)
;;;            ))

