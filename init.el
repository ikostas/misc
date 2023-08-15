(scroll-bar-mode -1) ;; switch off scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq default-frame-alist '((undecorated . t)))
(setq inhibit-startup-screen t) ;; switch off startup screen
(defalias 'list-buffers 'ibuffer)  ;; make ibuffer default

;; Dired settings
(setq dired-listing-switches "-lgGDhFv --group-directories-first") ;; making dired look better
(defun xah-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'xah-dired-mode-setup)
(require 'dired )
(if (< emacs-major-version 28)
    (progn
      (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file
      (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file ".."))) ; was dired-up-directory
      )
  (progn
    (setq dired-kill-when-opening-new-dired-buffer t)))
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(setq-default word-wrap t) ;; включаем перенос слов
(setq sentence-end-double-space nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 132 :width normal)))))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'solarized-wombat-dark t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "c97a653cd5172dc3606b461d32940460ddf1790260abfe080dcab561ff66fafb" "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "49cd634a5d2e294c281348ce933d2f17c19531998a262cbdbe763ef2fb41846b" "45b84ddcc65bdf01d9cc76061a9473e3291d82c9209eac0694fbbb81c57b92fd" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "c3957b559cf3606c9a40777c5712671db3c7538e5d5ea9f63eb0729afeac832b" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "1ebdc6eee73f94084f1a7211d6e462c29a6fc902ceb38c450eadba0e984da193" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "ea5a840bd2f9616a36890c27fd5e97528cb9fcfafa0e6739315bb12786d6c4ee" default))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(evil json-mode github-dark-vscode-theme github-modern-theme typescript-mode quasi-monochrome-theme tao-theme solarized-theme gruvbox-theme tangotango-theme yaml-mode go-projectile projectile go-mode use-package reverse-im markdown-mode))
 '(tool-bar-mode nil))
(use-package reverse-im
  :ensure t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  ;; (reverse-im-activate "ukrainian-computer") ; the legacy way
  :config
  (reverse-im-mode t))
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(put 'dired-find-alternate-file 'disabled nil)

;; markdown output command
(setq markdown-command
      (concat
       "/usr/bin/pandoc"
       " --from=markdown --to=html"
       " --standalone --mathjax --highlight-style=pygments"))

;; set chrome as default browser
(setq browse-url-browser-function 'browse-url-chrome)
(add-to-list 'auto-mode-alist '("\\.fizz\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.edge\\'" . mhtml-mode))

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(require 'go-projectile)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-ignore-buffers '("\\` " "^\*"))
(setq ido-ignore-files '("^\#" "\~$"))

;; Enable Evil
(require 'evil)
(evil-mode 1)
;; (setq evil-want-minibuffer t)
(add-hook 'prog-mode-hook 'global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; python 4 spaces instead of 8
(add-hook 'python-mode-hook
	  (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (setq python-indent-offset 4)))
