(require 'xgtags)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (xgtags-mode 1)
             ))

;;There are two hooks, gtags-mode-hook and gtags-select-mode-hook.
;;The usage of the hook is shown as follows.
;;
;;[Setting to use vi style scroll key]
(add-hook 'xgtags-mode-hook
          '(lambda ()
             (define-key xgtags-mode-map "\C-f" 'scroll-up)
             (define-key xgtags-mode-map "\C-b" 'scroll-down)
             ))

;;xgtags key map in evil 
(define-key evil-normal-state-map (kbd ",gg") 'xgtags-find-tag)
(define-key evil-normal-state-map (kbd ",gd") 'xgtags-find-tag)
(define-key evil-normal-state-map (kbd ",gc") 'xgtags-find-rtag)
(define-key evil-normal-state-map (kbd "\C-t") 'xgtags-pop-stack)
(define-key evil-normal-state-map (kbd ",j") 'xgtags-select-tag-near-point)

(add-hook 'xgtags-select-mode-hook
          (lambda ()
            (unicad)
            (define-key evil-normal-state-local-map "\r" 'xgtags-select-tag)
            (define-key evil-normal-state-local-map (kbd "\C-f") 'scroll-up)
            (define-key evil-normal-state-local-map (kbd "\C-b") 'scroll-down)
            (define-key evil-normal-state-local-map (kbd "j") 'next-line)
            (define-key evil-normal-state-local-map (kbd "k") 'previous-line)
            (define-key evil-normal-state-local-map (kbd "RET") 'xgtags-select-tag-near-point)
            (define-key evil-normal-state-local-map (kbd "\C-t") 'xgtags-pop-stack)
            ))

;;xgtags key map in viper
;;;(define-key viper-vi-global-user-map (kbd ",gg") 'xgtags-find-tag)
;;;(define-key viper-vi-global-user-map (kbd ",gd") 'xgtags-find-tag)
;;;(define-key viper-vi-global-user-map (kbd ",gc") 'xgtags-find-rtag)
;;;(define-key viper-vi-global-user-map (kbd ",p") 'xgtags-pop-stack)
;;;(define-key viper-vi-global-user-map (kbd ",j") 'xgtags-select-tag)
;;;(add-hook 'xgtags-mode-hook
;;;          (lambda ()
;;;            (local-set-key (kbd "\C-f") 'scroll-up)
;;;            (local-set-key (kbd "\C-b") 'scroll-down)
;;;            (local-set-key (kbd ",gd") 'xgtags-find-tag)
;;;            (local-set-key (kbd ",gc") 'xgtags-find-rtag)
;;;            (local-set-key (kbd ",p") 'xgtags-pop-stack)
;;;            ))
;;;;(define-key gtags-select-mode-map (kbd ",") 'leader-map)  
;;;(add-hook 'xgtags-select-mode-hook
;;;          (lambda ()
;;;            (local-set-key "\r" 'xgtags-select-tag)
;;;            (local-set-key (kbd "\C-f") 'scroll-up)
;;;            (local-set-key (kbd "\C-b") 'scroll-down)
;;;            (local-set-key (kbd "j") 'next-line)
;;;            (local-set-key (kbd "k") 'previous-line)
;;;            (local-set-key (kbd ",j") 'xgtags-select-tag)
;;;            (local-set-key (kbd ",p") 'xgtags-pop-stack)
;;;            ))

