(defun set-grep-command (command)
  "Set `grep-command'."
    (setq grep-find-command command))

(defvar grep-find-prompt
  "find . -type f ! \"(\" -path \"*/.svn*\" ! -o -path \"*~\" \")\" \
  -o \"(\" -name \"*.[ch]\" -o -name \"*[Mm]akefile\" -o -name \"*.make\" \")\"  \
  -print0 | xargs -0 -e grep -nH -e "
  "*Default prompt of `grep-find'.")

(defvar is-after-emacs-23 t)
(setq grep-find-command "find . ! -name \"*~\" ! -name \"#*#\" -type f -print0 | xargs -0 -e grep -nH -e ")
