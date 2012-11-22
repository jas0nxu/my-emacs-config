(setq evil-shift-width 4)
(require 'evil)
(evil-mode 1)
; (add-hook 'fundamental-mode-hook '(lambda () (evil-mode t) (unicad)))
;;disable evil for eshell
; (add-hook 'shell-mode-hook '(lambda () (evil-mode nil)))

;;my-list-matching-lines --start
(defconst my-symbol-regexp "[A-Za-z_][A-Za-z_0-9]*"
  "Regexp matching tag name.")
(defconst my-definition-regexp "#[ \t]*define[ \t]+\\|ENTRY(\\|ALTENTRY("
  "Regexp matching tag definition name.")
(defun my-match-string (n)
  (buffer-substring (match-beginning n) (match-end n)))

(defun my-current-token ()
  (cond
    ((looking-at "[0-9A-Za-z_]")
     (while (and (not (bolp)) (looking-at "[0-9A-Za-z_]"))
            (forward-char -1))
     (if (not (looking-at "[0-9A-Za-z_]")) (forward-char 1)))
    (t
      (while (looking-at "[ \t]")
             (forward-char 1))))
  (if (and (bolp) (looking-at my-definition-regexp))
    (goto-char (match-end 0)))
  (if (looking-at my-symbol-regexp)
    (my-match-string 0) nil))

(defun my-list-matching-lines ()
  "Input word and list all ocurrs in current buffer."
  (interactive)
  (let (wordname prompt)
    (setq wordname (my-current-token)) ;;so we require gtags.el
    (if wordname
      (setq prompt (concat "Find word: (default " wordname ") "))
      (nil)
      )
    (list-matching-lines wordname)
    )) 

;;my-list-matching-lines --end

(define-prefix-command 'leader-map)  
(define-key evil-normal-state-map (kbd ",") 'leader-map)  

(defun my-quick-save ()
    "Save current buffer"
    (interactive)
    (save-buffer nil))

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
;(define-key evil-normal-state-map (kbd ",cs") 'enhance-comment-dwim-line)
;(define-key evil-normal-state-map (kbd ",cc") 'enhance-comment-dwim-line)
;(define-key evil-normal-state-map (kbd ",cn") 'enhance-comment-dwim-line)
;(define-key evil-normal-state-map (kbd ", c SPC") 'enhance-comment-dwim-line)
;evil-leader couldn't process evil-visual-state-map
;;;(define-key evil-visual-state-map (kbd ",cs") 'enhance-comment-dwim-line)
;;;(define-key evil-visual-state-map (kbd ",cc") 'enhance-comment-dwim-line)
;;;(define-key evil-visual-state-map (kbd ",cn") 'enhance-comment-dwim-line)
;;;(define-key evil-visual-state-map (kbd ", c SPC") 'enhance-comment-dwim-line)


(setq evil-leader/leader "," evil-leader/in-all-states t)
(require 'evil-leader)

;make leader for visual state
(evil-leader/set-key "," 'evil-repeat-find-char-reverse)
(define-key evil-visual-state-map evil-leader/leader evil-leader/map)

(evil-leader/set-key
  "m" 'highlight-symbol-at-point
  "n" 'highlight-symbol-remove-all
  "RET" 'highlight-symbol-remove-all
  "ww" 'my-quick-save
  "qq" 'save-buffers-kill-terminal
  "bd" 'kill-buffer-and-window
  "bb" 'ido-switch-buffer
  "v" 'my-list-matching-lines
  "hv" 'list-matching-lines
  "tt" 'helm-imenu
  "cs" 'enhance-comment-dwim-line
  "cc" 'enhance-comment-dwim-line
  "cn" 'enhance-comment-dwim-line
  "c SPC" 'enhance-comment-dwim-line
  )
;;(define-key evil-normal-state-map (kbd ",") 'leader-map)  
;;(define-key evil-normal-state-map (kbd ",m") 'highlight-symbol-at-point)
;;(define-key evil-normal-state-map (kbd ",n") 'highlight-symbol-remove-all)
;;(define-key evil-normal-state-map (kbd ", RET") 'highlight-symbol-remove-all)
;;(define-key evil-normal-state-map (kbd ",ww") 'my-quick-save)
;;(define-key evil-normal-state-map (kbd ",qq") 'save-buffers-kill-terminal)
;;(define-key evil-normal-state-map (kbd ",bd") 'kill-buffer-and-window)
;;                                        ; (define-key evil-normal-state-map (kbd ",v") 'list-matching-lines)
;;; (define-key evil-normal-state-map (kbd ",v") 'helm-occur)
;;(define-key evil-normal-state-map (kbd ",v") 'my-list-matching-lines)
;;(define-key evil-normal-state-map (kbd ",hv") 'list-matching-lines)
;;(define-key evil-normal-state-map (kbd ",bd") 'kill-buffer-and-window)  
;;(define-key evil-normal-state-map (kbd ",qq") 'save-buffers-kill-terminal)
;;                                        ; (define-key evil-normal-state-map (kbd ",bb") 'ido-switch-buffer)
;;; (define-key evil-normal-state-map (kbd ",bb") 'helm-buffers-list)
;;(define-key evil-normal-state-map (kbd ",bb") 'ido-switch-buffer)
;;(define-key evil-normal-state-map (kbd ",tt") 'helm-imenu)

(define-key evil-insert-state-map (kbd "<escape>") 'my-ac-stop)
(define-key evil-normal-state-map (kbd "\C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "\C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "\C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "\C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "*") 'highlight-symbol-next-xyf)
(define-key evil-normal-state-map (kbd "#") 'highlight-symbol-prev-xyf)
(define-key evil-normal-state-map [f3] 'highlight-symbol-next)
(define-key evil-normal-state-map [(shift f3)] 'highlight-symbol-prev)
(define-key evil-normal-state-map (kbd "\C-y") 'yank)

(define-key evil-normal-state-map [(f12)] 'semantic-ia-fast-jump)
(define-key evil-normal-state-map [(f11)]
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

(defun my-open-above ()
  (interactive)
  ; (evil-end-of-line)
  (align-current)
  (evil-open-above 1)
  )
(defun my-open-below()
  (interactive)
  ; (evil-end-of-line)
  (align-current)
  (evil-open-below 1)
  )
(define-key evil-normal-state-map (kbd "o") 'my-open-below)
(define-key evil-normal-state-map (kbd "O") 'my-open-above)

;; Add '_' to the meaning of ":word:" everytime a buffer is loaded:
(add-hook 'after-change-major-mode-hook
          '(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-hook
          '(lambda () (modify-syntax-entry ?_ "w")))

(add-hook 'occur-mode-hook
          (lambda ()
            (define-key evil-emacs-state-local-map (kbd "\C-j") 'windmove-down)
            (define-key evil-emacs-state-local-map (kbd "\C-k") 'windmove-up)
            (define-key evil-emacs-state-local-map (kbd "\C-h") 'windmove-left)
            (define-key evil-emacs-state-local-map (kbd "\C-l") 'windmove-right)
            (define-key evil-emacs-state-local-map (kbd "j") 'next-line)
            (define-key evil-emacs-state-local-map (kbd "k") 'previous-line)
            (define-key evil-emacs-state-local-map (kbd "\C-n") 'next-line)
            (define-key evil-emacs-state-local-map (kbd "\C-p") 'previous-line)
            (define-key evil-emacs-state-local-map (kbd "\C-f") 'scroll-down)
            (define-key evil-emacs-state-local-map (kbd "\C-b") 'scroll-up)
            ))


