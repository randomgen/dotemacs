;; Increase gap between garbage collections to speed up startup.
(setq gc-cons-threshold (* 4 1024 1024))

;; Report startup time.
(add-hook 'emacs-startup-hook
          (lambda ()
            (let* ((elapsed (float-time (time-subtract after-init-time
                                                       before-init-time)))
                   (elapsed-ms (* elapsed 1000))
                   (gc-elapsed-ms (* gc-elapsed 1000)))
              (message "Emacs initialized in %.0f ms (%d GC taking %.0f ms)."
                       elapsed-ms
                       gcs-done
                       gc-elapsed-ms))))

;; Save options set with Customize to a separate file.
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Start with empty editor.
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0))

;; Display line and column positions.
(column-number-mode)

;; Enable interactive mode to open files and switch buffers.
(ido-mode t)

;; Change other defaults.
(setq-default c-basic-offset 4)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil)
(setq-default sentence-end-double-space nil)
(setq-default tab-width 4)
