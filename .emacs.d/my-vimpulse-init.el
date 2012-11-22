
;;vimpulse configure start
(require 'vimpulse)

;;;(define-key viper-vi-kbd-map (kbd ",m") 'highlight-symbol-at-point)
;;;(define-key viper-vi-kbd-map (kbd "*") 'highlight-symbol-next)
;;;(define-key viper-vi-kbd-map (kbd "#") 'highlight-symbol-prev)
;;;(define-key viper-vi-kbd-map (kbd ",n") 'highlight-symbol-remove-all)
;;;
;;;(define-key viper-vi-kbd-map (kbd "\C-j") 'windmove-down)
;;;(define-key viper-vi-kbd-map (kbd "\C-k") 'windmove-up)
;;;(define-key viper-vi-kbd-map (kbd "\C-h") 'windmove-left)
;;;(define-key viper-vi-kbd-map (kbd "\C-l") 'windmove-right)
; (define-key viper-vi-basic-map [(f5)] 'ido-find-file-in-tag-files)

(define-prefix-command 'leader-map)  
;(global-set-key (kbd ",") 'leader-map)
; (define-key viper-vi-basic-map (kbd ",") 'leader-map)  
(define-key viper-vi-global-user-map (kbd ",") 'leader-map)  
 
(defun my-quick-save ()
  "Save current buffer"
  (interactive)
  (save-buffer nil))
(define-key viper-vi-global-user-map (kbd ",") 'leader-map)  
(define-key viper-vi-global-user-map (kbd ",m") 'highlight-symbol-at-point)
(define-key viper-vi-global-user-map (kbd "*") 'highlight-symbol-next)
(define-key viper-vi-global-user-map (kbd "#") 'highlight-symbol-prev)
(define-key viper-vi-global-user-map (kbd ",n") 'highlight-symbol-remove-all)
(define-key viper-vi-global-user-map (kbd ", RET") 'highlight-symbol-remove-all)
(define-key viper-vi-global-user-map (kbd "\C-j") 'windmove-down)
(define-key viper-vi-global-user-map (kbd "\C-k") 'windmove-up)
(define-key viper-vi-global-user-map (kbd "\C-h") 'windmove-left)
(define-key viper-vi-global-user-map (kbd "\C-l") 'windmove-right)
(define-key viper-vi-global-user-map (kbd ",ww") 'my-quick-save)
(define-key viper-vi-global-user-map (kbd ",qq") 'save-buffers-kill-terminal)
(define-key viper-vi-global-user-map (kbd ",bd") 'kill-buffer-and-window)
(define-key viper-vi-global-user-map (kbd ",v") 'list-matching-lines)
(define-key viper-vi-global-user-map (kbd ",bd") 'kill-buffer-and-window)  
(define-key viper-vi-global-user-map (kbd ",qq") 'save-buffers-kill-terminal)
(define-key viper-vi-global-user-map (kbd ",bb") 'ido-switch-buffer)
(define-key viper-vi-global-user-map [(f12)] 'semantic-ia-fast-jump)
(define-key viper-vi-global-user-map [(f11)]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

(defun enhance-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
  If no region is selected and current line is not blank and we are not at the end of the line,
  then comment current line.
  Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(define-key viper-vi-global-user-map (kbd ",cs") 'enhance-comment-dwim-line)
(define-key viper-vi-global-user-map (kbd ",cc") 'enhance-comment-dwim-line)
(define-key viper-vi-global-user-map (kbd ", c SPC") 'enhance-comment-dwim-line)

(define-prefix-command 'ctl-w-map)  
(define-key occur-mode-map (kbd "C-w") 'ctl-w-map)  
(define-key occur-mode-map (kbd "\C-j") 'windmove-down)
(define-key occur-mode-map (kbd "\C-k") 'windmove-up)
(define-key occur-mode-map (kbd "\C-h") 'windmove-left)
(define-key occur-mode-map (kbd "\C-l") 'windmove-right)
(define-key occur-mode-map (kbd "j") 'next-line)
(define-key occur-mode-map (kbd "k") 'previous-line)
(define-key occur-mode-map (kbd "\C-f") 'scroll-down)
(define-key occur-mode-map (kbd "\C-b") 'scroll-up)


;; all mode inherit from fundamental-mode will be changed to viper-mode
(add-hook 'fundamental-mode-hook '(lambda () (viper-mode t) (unicad)))

;; auto-indent on o and O
(defadvice viper-open-line (after viper-open-line-with-indentation activate)
          (unless (eq major-mode 'text-mode) (indent-according-to-mode)))
(defadvice viper-Open-line (after viper-Open-line-with-indentation activate)
          (unless (eq major-mode 'text-mode) (indent-according-to-mode)))

;; undo tree
(require 'undo-tree)
(when (featurep 'undo-tree)
  (defadvice undo-tree-visualize
             (before ad-undo-tree-visualize-change-state-to-vi activate)
             (when (not (eq viper-current-state 'vi-state))
               (viper-change-state-to-vi)))
  (vimpulse-global-set-key 'vi-state (kbd "C-r") 'undo-tree-redo))

;;taglist
(require 'taglist)
; (global-set-key "\C-ct" 'taglist)
(define-key viper-vi-global-user-map (kbd ",tt") 'taglist)  
(define-key viper-vi-global-user-map (kbd "RET") 'taglist-jump) 
(define-key viper-vi-global-user-map (kbd "q") 'taglist-quit) 

;; vimpulse configure end
