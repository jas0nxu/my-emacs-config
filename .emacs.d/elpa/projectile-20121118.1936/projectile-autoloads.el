;;; projectile-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (projectile-mode projectile-global-mode) "projectile"
;;;;;;  ".emacs.d/elpa/projectile-20121118.1936/projectile.el" (20649
;;;;;;  62047))
;;; Generated autoloads from .emacs.d/elpa/projectile-20121118.1936/projectile.el

(defvar projectile-global-mode nil "\
Non-nil if Projectile-Global mode is enabled.
See the command `projectile-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `projectile-global-mode'.")

(custom-autoload 'projectile-global-mode "projectile" nil)

(autoload 'projectile-global-mode "projectile" "\
Toggle Projectile mode in all buffers.
With prefix ARG, enable Projectile-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Projectile mode is enabled in all buffers where
`projectile-on' would do it.
See `projectile-mode' for more information on Projectile mode.

\(fn &optional ARG)" t nil)

(autoload 'projectile-mode "projectile" "\
Minor mode to assist project management and navigation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil (".emacs.d/elpa/projectile-20121118.1936/projectile-pkg.el")
;;;;;;  (20649 62047 722748))

;;;***

(provide 'projectile-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; projectile-autoloads.el ends here
