;;(autoload "auctex.el" nil t t)
;;(autoload "preview-latex.el" nil t t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
;;(add-to-list 'load-path "~/.emacs.d/elpa/evil-20151101.1655")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(load-theme 'mustang t)
(require 'evil-leader)
(require 'evil)
(require 'powerline)
(powerline-default-theme)
;;(require 'w3m-load)
;;
;; Evil-leader
;;
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "o" 'other-window
  "k" 'kill-buffer
  "." 'open-org-files
  "j" 'org-journal-new-entry
  "ll" 'load-file "~/.emacs")
;;
(evil-mode 1)
;;
(setq font-lock-maximum-decoration t)
(show-paren-mode 1)
;;
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 140)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; shell-mode
(defun sh ()
  (interactive)
    (ansi-term "/bin/zsh"))
;;
;;Font-size change on the fly
;;
(defun sacha/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun sacha/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))
(global-set-key (kbd "C-+") 'sacha/increase-font-size)
(global-set-key (kbd "C--") 'sacha/decrease-font-size)
(modify-frame-parameters nil '((wait-for-wm . nil)))
;;
;;
(define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-page-down)
;;
;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
;;
;; 
(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)
;;
(define-key Info-mode-map "g" nil)

;;
;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "71c379d39642d7281407e56123ad7043b9874a1c18b20b6685730a86251a002e" "da89131baf2340515c6619a02cf41cd8445f2e8fb29fe346b7f8887eb8172ce3" "bf3ec301ea82ab546efb39c2fdd4412d1188c7382ff3bbadd74a8ecae4121678" "d8933e0547cb660ac7dfe690ea0683556fa22945ffc0bb7c768e8d91352fc8cd" "d737a2131d5ac01c0b2b944e0d2cb0be1c76496bb4ed61be51ff0e5457468974" "dc802070f6c40174e25fdd930df9f235a61101a5628eed63ccb1d511686ebdc5" "6c0a087a4f49c04d4002393ffd149672f70e4ab38d69bbe8b39059b61682b61c" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (w3m w3 eww-lnum jedi zenburn-theme wolfram-mode wiki-summary twittering-mode solarized-theme smex relative-line-numbers powerline-evil org-journal neotree mustang-theme magit lua-mode js2-mode ido-ubiquitous helm hackernews evil-tabs evil-leader company)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Wolfram-mode

;; (autoload 'wolfram-mode "wolfram-mode" nil t)
;; (autoload 'run-wolfram "wolfram-mode" nil t)
;; (setq wolfram-program "/usr/local/bin/math")
;; (add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))
;; (add-to-list 'auto-mode-alist '("\\.math$" . wolfram-mode))
;;
 (require 'ido)
    (ido-mode t)
(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)
;;
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;;
(add-to-list 'load-path "/directory/containing/neotree/")
(require 'neotree)
(global-set-key (kbd "<f2>") 'neotree-toggle)
;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;(require 'helm)
;;(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;;(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;;(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;;(when (executable-find "curl")
;;  (setq helm-google-suggest-use-curl-p t))

;;(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;      helm-ff-file-name-history-use-recentf t)

;;(helm-mode 1)
;;melpa
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(setq initial-major-mode 'org-mode)
(setq inhibit-splash-screen t)

(setq org-startup-indented t)
(setq org-blank-before-new-entry nil)
(setq initial-scratch-message nil)
(setq default-directory "~")
(setq org-directory "~/Documents/Org-Files")

(setq visible-bell 1)

;; Org-Journal
(require 'org-journal)
(setq org-journal-dir "~/Documents/Projects/org-files/journal")

;; MobileOrg
(setq org-mobile-use-encryption 1)
(setq org-mobile-files '("~/Documents/Org-Files"))
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/Apps/MobileOrg/inbox.org")


(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; Needed to make tab key working in org-mode (terminal mode)

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)))

(setq calender-mark-diary-entries-flag t)
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Hunspell (with German language support)

(add-to-list 'ispell-local-dictionary-alist '("deutsch-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "de_DE"); Dictionary file name
                                              nil
                                              iso-8859-1))

(add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "en_US")
                                              nil
                                              iso-8859-1))

(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
      ispell-dictionary   "en_US") ; Default dictionary to use

;; Jedi (Python auto-completion)

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;;======= Code folding =======
(add-hook 'python-mode-hook 'my-python-outline-hook)
; this gets called by outline to deteremine the level. Just use the length of the whitespace
(defun py-outline-level ()
  (let (buffer-invisibility-spec)
    (save-excursion
      (skip-chars-forward "    ")
      (current-column))))
; this get called after python mode is enabled
(defun my-python-outline-hook ()
  ; outline uses this regexp to find headers. I match lines with no indent and indented "class"
  ; and "def" lines.
  (setq outline-regexp "[^ \t]\\|[ \t]*\\(def\\|class\\) ")
  ; enable our level computation
  (setq outline-level 'py-outline-level)
  ; do not use their \C-c@ prefix, too hard to type. Note this overides some bindings.
  (setq outline-minor-mode-prefix "\C-t")
  ; turn on outline mode
  (outline-minor-mode t)
  ; initially hide all but the headers
  ;(hide-body)
  ; make paren matches visible
  (show-paren-mode 1)
  )

(eval-after-load "eww"
  '(progn (define-key eww-mode-map "f" 'eww-lnum-follow)
          (define-key eww-mode-map "F" 'eww-lnum-universal)))

;;
;;====== Open my .org files =====
;;

(defun open-org-files ()
  (interactive)
  (find-file "~/Documents/Projects/org-files/Personal.org")
  (find-file "~/Documents/Projects/org-files/Machine-Learning.org")
  (find-file "~/Documents/Projects/org-files/All.org")
 ) 

 (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
