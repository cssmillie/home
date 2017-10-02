(setq require-final-newline t)
(setq delete-auto-save-files t)

(defun my-exit-from-emacs()
  (interactive)
  ( if (yes-or-no-p "Do you want to exit ")
      (save-buffers-kill-emacs)))
(global-set-key "\C-x\C-c" 'my-exit-from-emacs)

(defun small-font()
  (interactive)
  (x-set-font "-adobe-courier-bold-r-*-*-12-*-*-*-*-*-*-*"))

(defun large-font()
  (interactive)
  (x-set-font "-adobe-courier-medium-r-*-*-14-*-*-*-*-*-*-*"))

(defun adjust-window-up()
  (interactive)
  (scroll-up 2))

(defun adjust-window-down()
  (interactive)
  (scroll-down 2))

