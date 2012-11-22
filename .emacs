(if (display-graphic-p)
  (load-theme 'deeper-blue)
  (load-theme 'tango-dark))

(add-to-list 'load-path "~/.emacs.d")

(tool-bar-mode -1)
(menu-bar-mode -1);去掉菜单栏
(scroll-bar-mode -1);去掉滚动

(setq usr-full-name "xuyufeng")
(setq user-mail-address "xuyufeng@ifreecomm.com")

(setq comment-style 'multi-line)
(setq inhibit-startup-message t) ;关闭启动画面
(setq visible-bell t) ;关闭出错时的提示声
(setq frame-title-format '("" buffer-file-name ""));在标题栏显示buffer名称
(setq default-fill-column 80) ;默认显示 80列就换行
(show-paren-mode t) ;括号匹配时显示另外一边的括号，而不跳到另一个括号
(setq mouse-yank-at-point t) ;支持中键粘贴
(setq x-select-enable-clipboard t) ;支持emacs和外部程序的粘贴
(column-number-mode t)
(setq mouse-yank-at-point t)
(setq tool-bar-button-margin 0)
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no
(display-time-mode 1) ;显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq default-frame-alist  ;设置启动窗口大小
      '((height . 30) (width . 100) (menu-bar-lines . 20) (tool-bar-lines . 0)))

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
;;don't auto recenter when do next-line in bottom
(setq scroll-conservatively 10000)

(show-paren-mode t)
(setq show-paren 'parentheses)

;;(setq frame-title-format "emacs@%b")
(setq-default frame-title-format
              '(:eval
                 (format "%s %s"
                         (buffer-name)
                         (cond 
                           (buffer-file-truename
                             (concat "(" buffer-file-truename ")"))
                           (dired-directory
                             (concat "{" dired-directory "}"))
                           (t
                             "[no file]")))))

;;(mouse-avoidance-mode 'animate)
;;(set-default-font "Consolas-11")
(set-default-font "Liberation Mono-10")
(setq make-backup-files nil)
(setq auto-save-mode nil)
;;disable backup
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)
;; 外部修改自动提示
(global-auto-revert-mode t)

(setq visible-bell nil)
(blink-cursor-mode -1)
(global-linum-mode t)
(global-font-lock-mode t)

(defun my-lisp-mode-hook()
            (local-set-key "\C-j" 'windmove-down)
            (local-set-key "\C-k" 'windmove-up)
            (local-set-key "\C-h" 'windmove-left)
            (local-set-key "\C-l" 'windmove-right)
            ;;(local-set-key "\C-n" 'next-line)
            ;;(local-set-key "\C-p" 'previous-line)
            ;;(local-set-key "\C-f" 'scroll-down)
            ;;(local-set-key "\C-b" 'scroll-up)
            )
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)

(global-set-key "\r" 'align-newline-and-indent)

(setq c-default-style "linux")
(setq c-basic-offset 4)

;;useing package manager
(require 'package)
(package-initialize)

;;icicles
;;(require 'icicles)
;;(icy-mode t)

(require 'highlight-symbol)

(require 'ido)
(ido-mode t)

;;(require 'smart-tab)
;;(global-smart-tab-mode 1)

;;(require 'auto-indent-mode)
;;(setq auto-indent-assign-indent-level 4)
;;(setq auto-indent-next-pair-timer-interval (quote ((lisp-interaction-mode 1.5) (emacs-lisp-mode 1.5) (c-mode 1.5) (default 0.0005))))
;;(auto-indent-global-mode)

;;(require 'autopair)
;;(autopair-global-mode)
;;

;;we can use this command to transfer file list to TAGS form
;;awk '{print "\014\012" $0 ",0" }' cscope.files > TAGS
(defun ido-find-file-in-tag-files ()
    (interactive)
    (save-excursion
        (let ((enable-recursive-minibuffers t)) (visit-tags-table-buffer))
        (find-file (expand-file-name
                    (ido-completing-read "Project file: "
                                         (tags-table-files) nil t)))))
; (global-set-key "\C-t" 'ido-find-file-in-tag-files)
(global-set-key [(f5)] 'ido-find-file-in-tag-files)

(defun execvp (&rest args)
  "Simulate C's execvp() function.
  Quote each argument seperately, join with spaces and call shell-command-to-string to run in a shell."
  (let ((cmd (mapconcat 'shell-quote-argument args " ")))
   (message cmd)
    (shell-command-to-string cmd)))
(defun my-update-tags ()
  (interactive)
  (message "xyf in my-update-tags")
  (shell-command-to-string "gtags --gtagsconf ~/gtags.conf -f cscope.files -i")
  ; (execvp "gtags --gtagsconf ~/gtags.conf -f cscope.files -i")
  )
(global-set-key [(f9)] 'my-update-tags)

;;disable auto change current directory
(defmacro disallow-cd-in-function (fun)
    "Prevent FUN (or any function that FUN calls) from changing directory."
    `(defadvice ,fun (around dissallow-cd activate)
         (let ((old-dir default-directory) ; Save old directory
               (new-buf ad-do-it)) ; Capture new buffer
             ;; If FUN returns a buffer, operate in that buffer in addition
             ;; to current one.
             (when (bufferp new-buf)
                 (set-buffer new-buf)
                 (setq default-directory old-dir))
             ;; Set default-directory in the current buffer
             (setq default-directory old-dir))))
;;(disallow-cd-in-function find-file-noselect-1)
;;(disallow-cd-in-function set-visited-file-name)

(define-prefix-command 'ctl-z-map)  
(global-set-key (kbd "C-z") 'ctl-z-map)  

(require 'unicad)
(require 'ctypes)

(require 'yasnippet)
(yas-global-mode 1)
;;;(add-hook 'c-mode-hook
;;;          (lambda () 
;;;            (define-key c-mode-base-map [(tab)] 'yas/expand)))
(add-hook 'c-mode-common-hook
          (lambda ()
           (define-key c-mode-base-map (kbd "TAB") 'yas/expand)))

(defvar enable-cedet nil)
(defvar use-buildin-cedet nil)
(defvar enable-clang-completion nil)
(defvar use-gtags nil)

(setq enable-clang-completion t)
; (setq enable-cedet t)
; (setq use-buildin-cedet t)
(setq use-gtags t)

(load-file "~/.emacs.d/my-ac-init.el")
(load-file "~/.emacs.d/my-igrep-init.el")
;;load vimpulse setting
; (load-file "~/.emacs.d/my-vimpulse-init.el")

;;load evil setting
(load-file "~/.emacs.d/my-evil-init.el")

(when (file-exists-p "GTAGS")
    (if use-gtags
            (progn
                (message "load gtags")
                (load-file "~/.emacs.d/my-gtags-init.el"))
        (progn
            (message "load xgtags")
            (load-file "~/.emacs.d/my-xgtags-init.el")))
    )

(when (file-exists-p "cscope.out")
    (load-file "~/.emacs.d/my-cscope-init.el")
    ) 


(tool-bar-mode -1)
(menu-bar-mode -1);去掉菜单栏
(scroll-bar-mode -1);去掉滚动
(global-set-key "\C-j" 'windmove-down)
(global-set-key "\C-k" 'windmove-up)
(global-set-key "\C-h" 'windmove-left)
(global-set-key "\C-l" 'windmove-right)
(global-set-key (kbd "\C-f") 'scroll-down)
(global-set-key (kbd "\C-b") 'scroll-up)
(global-set-key "\C-ch" 'help-command)
(global-set-key "\C-cj" 'eval-print-last-sexp)
(global-set-key [(f10)] 'menu-bar-open)

(setq display-buffer-reuse-frames t)
(setq split-width-threshold nil)


(when (file-exists-p "project-setting.el")
  (defconst my-project-setting-file (concat (getenv "PWD") "/project-setting.el"))
  (load-file my-project-setting-file))

(load-file "~/.emacs.d/my-doxymacs-init.el")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

;;(require 'rainbow-delimiters)
;;(global-rainbow-delimiters-mode)
;;(defun rainbow-colors()
;;  (if (display-graphic-p) 
;;    ;;gui setting
;;    (progn
;;      (set-face-foreground 'rainbow-delimiters-depth-1-face "white")
;;      (set-face-foreground 'rainbow-delimiters-depth-2-face "orange red")
;;      (set-face-foreground 'rainbow-delimiters-depth-3-face "blue1")
;;      (set-face-foreground 'rainbow-delimiters-depth-4-face "green")
;;      (set-face-foreground 'rainbow-delimiters-depth-5-face "yellow")
;;      (set-face-foreground 'rainbow-delimiters-depth-6-face "cyan3")
;;      (set-face-foreground 'rainbow-delimiters-depth-7-face "magenta")
;;      (set-face-foreground 'rainbow-delimiters-depth-8-face "light green")
;;      (set-face-foreground 'rainbow-delimiters-depth-9-face "orange"))
;;    ;;console setting
;;    (progn
;;      (set-face-foreground 'rainbow-delimiters-depth-1-face "white")
;;      (set-face-foreground 'rainbow-delimiters-depth-8-face "brightblue")
;;      (set-face-foreground 'rainbow-delimiters-depth-3-face "brightred")
;;      (set-face-foreground 'rainbow-delimiters-depth-4-face "color-46")
;;      (set-face-foreground 'rainbow-delimiters-depth-5-face "color-27")
;;      (set-face-foreground 'rainbow-delimiters-depth-6-face "cyan")
;;      (set-face-foreground 'rainbow-delimiters-depth-7-face "magenta")
;;      (set-face-foreground 'rainbow-delimiters-depth-2-face "color-56")
;;      (set-face-foreground 'rainbow-delimiters-depth-9-face "color-143"))))
;;(rainbow-colors)

; (require 'switch-window)

(setq helm-buffers-favorite-modes '(lisp-interaction-mode
                                     emacs-lisp-mode
                                     text-mode
                                     org-mode
                                     fundamental-mode
                                     shell-mode
                                     igrep-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-interval (quote ((lisp-interaction-mode 1.5) (emacs-lisp-mode 1.5) (c-mode 1.5) (default 0.0005)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
