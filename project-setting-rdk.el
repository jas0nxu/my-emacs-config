;; control what feature to enable
(setq enable-clang-completion t)
(setq enable-cedet nil)
(setq use-buildin-cedet nil)
(setq use-gtags t)

;;Test Code
; (defconst my-project-include (concat (getenv "PWD") "/include"))
; (message my-project-include)

;;;Warnning ECB will break semantic funtion if it is inited after cedet!!!!
;;(add-hook 'ecb-common-tree-buffer-after-create-hook
;;          (lambda ()
;;             (local-set-key (kbd "C-f") 'scroll-up)
;;             (local-set-key (kbd "C-b") 'scroll-down)
;;             (local-set-key (kbd "/") 'vimpulse-search-forward)
;;             (local-set-key (kbd "?") 'vimpulse-search-backward)
;;             (local-set-key (kbd "n") 'viper-search-next)
;;             (local-set-key (kbd "N") 'viper-search-Next)
;;             (local-set-key (kbd "j") 'viper-next-line)
;;             (local-set-key (kbd "k") 'viper-previous-line)
;;             (local-set-key (kbd "h") 'viper-backward-char)
;;             (local-set-key (kbd "l") 'viper-forward-char)
;;             ))
;;
;;(add-hook 'ecb-methods-buffer-after-create-hook
;;          (lambda ()
;;             (local-set-key (kbd "j") 'viper-next-line)
;;             (local-set-key (kbd "k") 'viper-previous-line)
;;             ))
;;
;;
;;(add-to-list 'load-path "~/.emacs.d/ecb-snap")
;;(require 'ecb-autoloads)
;;
;;(global-set-key (kbd "<f10>") 'ecb-minor-mode)
;;
;;(setq ecb-layout-name "my-ecb-layout")
;;(setq ecb-tip-of-the-day nil
;;      inhibit-startup-message t
;;      ecb-auto-compatibility-check nil
;;      ecb-windows-width 0.25
;;      ecb-version-check nil)
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(ecb-layout-window-sizes (quote (("my-ecb-layout" (0.3 . 0.9666666666666667)))))
;; '(ecb-options-version "2.40"))
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; )

;;;;semantic integration with imenu 
  ;;;;(display of a menu with a list of functions, variables, and other tags)
  (defun my-semantic-hook ()
    (imenu-add-to-menubar "TAGS"))
; (add-hook 'semantic-init-hooks 'my-semantic-hook)

;;;(defun my-linux-semantic-setting()
;;;  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat (getenv "PWD") "/include/generated/autoconf.h"))
;;;  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat (getenv "PWD") "/include/linux/kernel.h"))
;;;  (semantic-reset-system-include 'c-mode)
;;;
;;;  (semantic-add-system-include "/opt/arm-2009q1/lib/gcc/arm-none-linux-gnueabi/4.3.3/include" 'c-mode)
;;;  (semantic-add-system-include (concat (getenv "PWD") "/arch/arm/include") 'c-mode)
;;;  (semantic-add-system-include (concat (getenv "PWD") "/include") 'c-mode)
;;;  (semantic-add-system-include (concat (getenv "PWD") "/arch/arm/mach-omap2/include") 'c-mode)
;;;  (semantic-add-system-include (concat (getenv "PWD") "/arch/arm/plat-omap/include") 'c-mode)
;;;
;;;  (semantic-c-add-preprocessor-symbol "__KERNEL__" "")
;;;  (semantic-c-add-preprocessor-symbol "__LINUX_ARM_ARCH__" "7")
;;;  (semantic-c-add-preprocessor-symbol "KBUILD_STR(s)" "#s")
;;;  (semantic-c-add-preprocessor-symbol "KBUILD_BASENAME" "KBUILD_STR(main)")
;;;  (semantic-c-add-preprocessor-symbol "KBUILD_MODNAME" "KBUILD_STR(main)"))

(defun my-project-semantic-setting()
  (semantic-add-system-include (concat (getenv "PWD") "") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/mcfw/src_linux/osa/inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/mcfw/src_bios6/utils") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/mcfw/src_linux/mcfw_api") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/mcfw/src_linux/mcfw_api/filter_include") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/mcfw/src_linux/mcfw_api/filter_include/compdef") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/xdc/xdctools_3_23_01_43/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages/ti/psp/vps") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages/ti/psp/vps/common") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages/ti/psp/vps/core") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages/ti/psp/vps/hal") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/bios/bios_6_33_02_31/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/ipc/ipc_1_24_02_27/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/syslink/syslink_2_10_02_17_evm816x/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/xdc/xdctools_3_23_01_43/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/framework_components/framework_components_3_22_00_05/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/xdais/xdais_7_22_00_03/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/REL.500.V.H264AVC.E.IVAHD.02.00.02.01/500.V.H264AVC.E.IVAHD.02.00/IVAHD_001/Inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/REL.500.V.H264AVC.D.HP.IVAHD.02.00.04.01/500.V.H264AVC.D.HP.IVAHD.02.00/IVAHD_001/Inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/REL.500.V.MJPEG.E.IVAHD.01.00.02.00/500.V.MJPEG.E.IVAHD.01.00/IVAHD_001/inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/REL.500.V.MJPEG.D.IVAHD.01.00.04.00/500.V.MJPEG.D.IVAHD.01.00/IVAHD_001/inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/REL.500.V.MPEG4.D.IVAHD.01.00.06.00/500.V.MPEG4.D.ASP.IVAHD.01.00/IVAHD_001/Inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/ivahd_hdvicp/hdvicp20/inc") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/edma3lld/edma3_lld_02_11_02_04/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/rpe/remote-processor-execute/include") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/rpe/remote-processor-execute/src/include") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/c674x_aaclcdec_01_41_00_00_elf/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/codecs/c674x_aaclcenc_01_00_01_00_elf_patched/packages") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/xdais/xdais_7_22_00_03/packages/ti/xdais/dm") 'c-mode)
  (semantic-add-system-include (concat (getenv "PWD") "/../ti_tools/xdais/xdais_7_22_00_03/packages/ti/xdais  ") 'c-mode)
  (semantic-c-add-preprocessor-symbol "__TMS470__" "")
  (semantic-c-add-preprocessor-symbol "__TI_COMPILER_VERSION__" "4009000")
  (semantic-c-add-preprocessor-symbol "TI_816X_BUILD" "")
  (semantic-c-add-preprocessor-symbol "xdc_target_name__" "M3")
  (semantic-c-add-preprocessor-symbol "xdc_target_types__" "ti/targets/arm/elf/std.h")
  )

(defun my-buildin-cedet-setting()
  ;;Use buildin Semantic
  (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                     global-semanticdb-minor-mode
                                     global-semantic-idle-summary-mode
                                     global-semantic-mru-bookmark-mode))
  (semantic-mode 1)
  (global-semantic-show-parser-state-mode 1)
  ;(global-semantic-highlight-edits-mode (if window-system 1 -1))
  (global-semantic-highlight-edits-mode -1)

  (require 'semantic/bovine/c)
  (my-project-semantic-setting))

(defun my-extenal-cedet-setting()
  ;;disable buildin cedet
  (setq load-path (remove "/usr/local/share/emacs/24.2/lisp/cedet" load-path))
  ;;load extenal cedet
  (add-to-list 'load-path "~/.emacs.d/cedet")
  (load-file "~/.emacs.d/cedet/common/cedet.el")
  ;; (semantic-load-enable-minimum-features)
  (semantic-load-enable-code-helpers)
  ;; (semantic-load-enable-guady-code-helpers)
  ; (semantic-load-enable-excessive-code-helpers)

  ; (semantic-load-enable-semantic-debugging-helpers)
  ; (global-semantic-show-unmatched-syntax-mode 1)
  (global-semantic-show-parser-state-mode 1)

  (require 'semantic-c nil 'noerror)
  (semantic-reset-system-include 'c-mode)
  (my-project-semantic-setting)
  (require 'semantic-ia nil 'noerror)
  (require 'semanticdb nil 'noerror)
  (global-semanticdb-minor-mode 1)
  )

(defun my-cedet-setup()
  (if enable-cedet
    (progn
      (message "xyf enable-semantic")
      (add-hook 'semantic-init-hooks 'my-semantic-hook)
      (if use-buildin-cedet
        ;;Use buildin Semantic
        (
         progn
         (message "xyf use-buildin-semantic")
         (my-buildin-cedet-setting)
         )
        ;;Use seperate Semantic
        (
         progn
         (message "xyf use extenal cedet")
         (my-extenal-cedet-setting)
         )
        )))
  )
(my-cedet-setup)

;;ac-clang
(defun my-clang-setup()
  (if enable-clang-completion 
    (progn
      (message "xyf enable-clang-completion")
      (setq ac-clang-flags
            '("-D__TMS470__"
              "-D__TI_COMPILER_VERSION__=4009000"
              "-DTI_816X_BUILD"
              "-Dxdc_target_name__=M3"
              "-Dxdc_target_types__=ti/targets/arm/elf/std.h"
              "-I/usr/include"
              "-I/usr/local/include"
              "-I/usr/lib/gcc/i486-linux-gnu/4.4.5/include"
              "-I/usr/lib/gcc/i486-linux-gnu/4.4.5/include-fixed"
              "-I/usr/include/c++"
              "-I/usr/include/c++/4.4.5"
              "-I/usr/include/c++/4.4.5/i486-linux-gnu"
              "-I/usr/include/c++/4.4.5/backward"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/vc_rdk"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/vc_rdk/mcfw/src_linux/osa/inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/vc_rdk/mcfw/src_linux/mcfw_api/filter_include"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/vc_rdk/mcfw/src_linux/mcfw_api/filter_include/compdef"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/bios/bios_6_33_02_31/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/ipc/ipc_1_24_02_27/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/syslink/syslink_2_10_02_17_evm816x/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/xdc/xdctools_3_23_01_43/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/hdvpss/hdvpss_01_00_01_37_patched/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/framework_components/framework_components_3_22_00_05/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/xdais/xdais_7_22_00_03/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/REL.500.V.H264AVC.E.IVAHD.02.00.02.01/500.V.H264AVC.E.IVAHD.02.00/IVAHD_001/Inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/REL.500.V.H264AVC.D.HP.IVAHD.02.00.04.01/500.V.H264AVC.D.HP.IVAHD.02.00/IVAHD_001/Inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/REL.500.V.MJPEG.E.IVAHD.01.00.02.00/500.V.MJPEG.E.IVAHD.01.00/IVAHD_001/inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/REL.500.V.MJPEG.D.IVAHD.01.00.04.00/500.V.MJPEG.D.IVAHD.01.00/IVAHD_001/inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/REL.500.V.MPEG4.D.IVAHD.01.00.06.00/500.V.MPEG4.D.ASP.IVAHD.01.00/IVAHD_001/Inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/ivahd_hdvicp/hdvicp20/inc"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/edma3lld/edma3_lld_02_11_02_04/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/rpe/remote-processor-execute/include"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/rpe/remote-processor-execute/src/include"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/c674x_aaclcdec_01_41_00_00_elf/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/codecs/c674x_aaclcenc_01_00_01_00_elf_patched/packages"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/xdais/xdais_7_22_00_03/packages/ti/xdais/dm"
              "-I/home/xuyufeng/VCSDK_01.01.00.02/ti_tools/xdais/xdais_7_22_00_03/packages/ti/xdais")
            ))))
(my-clang-setup)

; (setq projectile-globally-ignored-directories '("bin" "docs" "lib" "build" "mcfw/src_linux/kernel_modules"))

;;Desktop
(require 'desktop)
;;;(setq desktop-path '("~/.emacs.d/"))
(add-to-list 'desktop-path (concat (getenv "PWD") "/"))
(setq desktop-dirname (concat (getenv "PWD") "/"))
(setq desktop-base-file-name ".emacs-desktop")
(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
(add-to-list 'desktop-modes-not-to-save 'custom-mode)
(desktop-save-mode 1)

;;ido
(setq
  ido-save-directory-list-file (concat (getenv "PWD") "/.ido.last")
  ido-ignore-buffers ;;gnore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*"))

(setq save-place-file (concat (getenv "PWD") "/.emacs-places"))
