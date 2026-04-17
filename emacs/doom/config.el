;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
(setq doom-theme 'gruvbox-dark-soft)
;; THEMES: gruvbox-dark-soft, doom-ayu-dark, vscode-dark-plus, doom-dracula, doom-monokai-specturm, doom-molokai,
;;      doom-gruvbox, naysayer, doom-monokai-classic, github-dark, doom-dark+, doom-one

(setq doom-font (font-spec :family "Menlo" :size 14 :weight 'regular))
;; (setq doom-font (font-spec :family "Cascadia Mono" :size 13 :weight 'regular))
;; cascadia for visual studio, menlo for vscode mac, JetBrains Mono

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(xterm-mouse-mode 1)
(blink-cursor-mode 1)
(setq treemacs-width 30)
(setq treemacs--width-is-locked nil)
(setq treemacs-width-is-initially-locked nil)

(use-package! whitespace
  :config
  (setq
   whitespace-style '(face tabs tab-mark spaces space-mark trailing newline newline-mark)
   whitespace-display-mappings '(
                                 (space-mark   ?\     [?\u00B7]     [?.])
                                 (space-mark   ?\xA0  [?\u00B7]     [?_])
                                 (newline-mark ?\n    [?\u00B7 ?\n])
                                 (tab-mark     ?\t    [?\u00B7 ?\t] [?\\ ?\t])))
  (global-whitespace-mode +1))
(custom-set-faces!
  `(line-number :foreground "#30363", :background "#30363"))
;;   `(whitespace-space :foreground "#30363d")
;;   `(whitespace-newline :foreground "#30363d")
;;   `(whitespace-tab :foreground "#30363d"))

(map! :nvie "s-z" #'undo) ;; Command-Z to undo
(map! :nvie "C-z" #'undo-redo) ;; Ctrl-Z to redo
;; Multi-cursor with Cmd + Option + Arrows
(map! :nvie "s-M-<down>" #'evil-mc-make-cursor-move-next-line)
(map! :nvie "s-M-<up>"   #'evil-mc-make-cursor-move-prev-line)
;; Map Command + F2 to "Change All Occurrences" (iedit)
(map! :nvie "s-<f2>" #'iedit-mode)
;; Jump to top/bottom of file with Cmd + Up/Down
(map! :nvie "s-<up>"   #'beginning-of-buffer)
(map! :nvie "s-<down>" #'end-of-buffer)

(use-package! drag-stuff
  :defer t
  :init
  (drag-stuff-global-mode 1)
  :config
  (map! :nvie "M-<up>"   #'drag-stuff-up
        :nvie "M-<down>" #'drag-stuff-down))


;; To stop/clear all cursors, press Escape


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'naysayer)
;; (setq doom-theme 'doom-monokai-classic)
(setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-dark+)

(setq doom-font (font-spec :family "Menlo" :size 14 :weight 'regular))
;; (setq doom-font (font-spec :family "Cascadia Mono" :size 13 :weight 'regular))
;; cascadia for visual studio, menlo for vscode mac, JetBrains Mono

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(xterm-mouse-mode 1)
(blink-cursor-mode 1)
(setq treemacs-width 30)
(setq treemacs--width-is-locked nil)
(setq treemacs-width-is-initially-locked nil)

(use-package! whitespace
  :config
  (setq
   whitespace-style '(face tabs tab-mark spaces space-mark trailing newline newline-mark)
   whitespace-display-mappings '(
                                 (space-mark   ?\     [?\u00B7]     [?.])
                                 (space-mark   ?\xA0  [?\u00B7]     [?_])
                                 (newline-mark ?\n    [?\u00B7 ?\n])
                                 (tab-mark     ?\t    [?\u00B7 ?\t] [?\\ ?\t])))
  (global-whitespace-mode +1))

(map! :nvie "s-z" #'undo) ;; Command-Z to undo
(map! :nvie "C-z" #'undo-redo) ;; Ctrl-Z to redo
;; Multi-cursor with Cmd + Option + Arrows
(map! :nvie "s-M-<down>" #'evil-mc-make-cursor-move-next-line)
(map! :nvie "s-M-<up>"   #'evil-mc-make-cursor-move-prev-line)
;; Map Command + F2 to "Change All Occurrences" (iedit)
(map! :nvie "s-<f2>" #'iedit-mode)
;; Jump to top/bottom of file with Cmd + Up/Down
(map! :nvie "s-<up>"   #'beginning-of-buffer)
(map! :nvie "s-<down>" #'end-of-buffer)

(use-package! drag-stuff
  :defer t
  :init
  (drag-stuff-global-mode 1)
  :config
  (map! :nvie "M-<up>"   #'drag-stuff-up
        :nvie "M-<down>" #'drag-stuff-down))


;; To stop/clear all cursors, press Escape


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'naysayer)
;; (setq doom-theme 'doom-monokai-classic)
(setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-dark+)

(setq doom-font (font-spec :family "Menlo" :size 14 :weight 'regular))
;; (setq doom-font (font-spec :family "Cascadia Mono" :size 13 :weight 'regular))
;; cascadia for visual studio, menlo for vscode mac, JetBrains Mono

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(xterm-mouse-mode 1)
(blink-cursor-mode 1)
(setq treemacs-width 30)
(setq treemacs--width-is-locked nil)
(setq treemacs-width-is-initially-locked nil)

(use-package! whitespace
  :config
  (setq
   whitespace-style '(face tabs tab-mark spaces space-mark trailing newline newline-mark)
   whitespace-display-mappings '(
                                 (space-mark   ?\     [?\u00B7]     [?.])
                                 (space-mark   ?\xA0  [?\u00B7]     [?_])
                                 (newline-mark ?\n    [?\u00B7 ?\n])
                                 (tab-mark     ?\t    [?\u00B7 ?\t] [?\\ ?\t])))
  (global-whitespace-mode +1))

(map! :nvie "s-z" #'undo) ;; Command-Z to undo
(map! :nvie "C-z" #'undo-redo) ;; Ctrl-Z to redo
;; Multi-cursor with Cmd + Option + Arrows
(map! :nvie "s-M-<down>" #'evil-mc-make-cursor-move-next-line)
(map! :nvie "s-M-<up>"   #'evil-mc-make-cursor-move-prev-line)
;; Map Command + F2 to "Change All Occurrences" (iedit)
(map! :nvie "s-<f2>" #'iedit-mode)
;; Jump to top/bottom of file with Cmd + Up/Down
(map! :nvie "s-<up>"   #'beginning-of-buffer)
(map! :nvie "s-<down>" #'end-of-buffer)

(use-package! drag-stuff
  :defer t
  :init
  (drag-stuff-global-mode 1)
  :config
  (map! :nvie "M-<up>"   #'drag-stuff-up
        :nvie "M-<down>" #'drag-stuff-down))


;; To stop/clear all cursors, press Escape


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'naysayer)
;; (setq doom-theme 'doom-monokai-classic)
(setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-dark+)

(setq doom-font (font-spec :family "Menlo" :size 14 :weight 'regular))
;; (setq doom-font (font-spec :family "Cascadia Mono" :size 13 :weight 'regular))
;; cascadia for visual studio, menlo for vscode mac, JetBrains Mono

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(xterm-mouse-mode 1)
(blink-cursor-mode 1)
(setq treemacs-width 30)
(setq treemacs--width-is-locked nil)
(setq treemacs-width-is-initially-locked nil)

(use-package! whitespace
  :config
  (setq
   whitespace-style '(face tabs tab-mark spaces space-mark trailing newline newline-mark)
   whitespace-display-mappings '(
                                 (space-mark   ?\     [?\u00B7]     [?.])
                                 (space-mark   ?\xA0  [?\u00B7]     [?_])
                                 (newline-mark ?\n    [?\u00B7 ?\n])
                                 (tab-mark     ?\t    [?\u00B7 ?\t] [?\\ ?\t])))
  (global-whitespace-mode +1))

(map! :nvie "s-z" #'undo) ;; Command-Z to undo
(map! :nvie "C-z" #'undo-redo) ;; Ctrl-Z to redo
;; Multi-cursor with Cmd + Option + Arrows
(map! :nvie "s-M-<down>" #'evil-mc-make-cursor-move-next-line)
(map! :nvie "s-M-<up>"   #'evil-mc-make-cursor-move-prev-line)
;; Map Command + F2 to "Change All Occurrences" (iedit)
(map! :nvie "s-<f2>" #'iedit-mode)
;; Jump to top/bottom of file with Cmd + Up/Down
(map! :nvie "s-<up>"   #'beginning-of-buffer)
(map! :nvie "s-<down>" #'end-of-buffer)

(use-package! drag-stuff
  :defer t
  :init
  (drag-stuff-global-mode 1)
  :config
  (map! :nvie "M-<up>"   #'drag-stuff-up
        :nvie "M-<down>" #'drag-stuff-down))


;; To stop/clear all cursors, press Escape


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
