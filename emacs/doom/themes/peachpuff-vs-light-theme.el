;;; peachpuff-vs-light-theme.el

(deftheme peachpuff-vs-light "peachpuff, light variant")

;; --- Custom extra faces + C++ token highlighting ----------------------
;; Same hook/faces as the dark peachpuff theme -- kept as-is (your own
;; hand-picked colors); flag if they read low-contrast on white and want
;; them darkened too.

;; 1. Define a custom face for the targeted keywords
(defface my-cpp-isolated-keyword-face
  '((t :foreground "#b8b839"))
  "Face for tracking targeted isolated words.")

(defface my-number-highlight-face
  '((t :foreground "#cc4631")) ; Highlights standalone numbers in red
  "Face for highlighting numbers.")

;; 2. Inject target match regex patterns into C++ mode highlight pipelines
(defun my-custom-cpp-fontification-rules ()
  "Add high-priority highlight rules for target tokens."
  (font-lock-add-keywords
   nil
   '(;; Match explicit keywords: return, public, and private
     ("\\<\\(return\\|public\\|private\\|if\\|break\\|while\\|noexcept\\|switch\\|case\\|static_cast\\|dynamic_cast\\|const_cast\\|reinterpret_cast\\|using\\|delete\\|default\\|this\\|continue\\)\\>" . 'my-cpp-isolated-keyword-face)

     ;; Match standalone numbers (integers and decimals)
     ("\\<[0-9]+\\(?:\\.[0-9]+\\)?\\>" . 'my-number-highlight-face)

     ("\\<\\(false\\|true\\|NULL\\|nullptr\\)\\>" . 'my-number-highlight-face))))

;; 3. Register the rule execution logic into the C++ hook tracker
(add-hook 'c++-mode-hook #'my-custom-cpp-fontification-rules)

(let ((pp-bg          "#FFFFFF")   ; white background
      (pp-fg          "#1d1d1d")   ; dark default text / variables (was the old bg)
      (pp-comment     "#24A10C")   ; comment green, darkened for contrast on white
      (pp-preproc     "#B51DB9")   ; preprocessor pink, darkened
      (pp-keyword     "#378726")   ; keyword/type green, darkened
      (pp-literal     "#B54121")   ; string/number/bool orange, darkened
      (pp-linenum     "#94942E")   ; line-number olive, darkened
      (pp-vscodeline  "#00A2AD")
      (pp-zshfringe   "#6B00EB")
      (pp-modeline    "#780099")
      (pp-black       "#000000")
      (pp-blue        "#0000FF")
      (pp-cyan        "#00AAB8")
      ;; Derived tones -- light-theme versions: pale neutrals/tints
      ;; instead of the dark theme's dark neutrals/tints.
      (pp-gray-dim    "#EDEDED")   ; pale neutral (widget/box bg, inactive modeline)
      (pp-gray-mid    "#757575")   ; muted text, darkened enough to read on white
      (pp-select-bg   "#D9E8EF")   ; pale blue-gray selection
      (pp-comment-tint "#E2F7DE") ; pale green tint, for diff bg
      (pp-literal-tint "#F5E5E1") ; pale orange tint, for diff bg
      (pp-preproc-tint "#F4E0F5") ; pale pink tint, for diff bg
      (pp-folded-bg   "#F2F2E3")) ; pale olive tint, for folds

  (custom-theme-set-faces
   'peachpuff-vs-light

   ;; --- Basic / UI faces --------------------------------------------
   `(default ((t (:background ,pp-bg :foreground ,pp-fg))))
   `(cursor ((t (:background ,pp-fg :foreground ,pp-bg))))
   `(fringe ((t (:background ,pp-bg :foreground ,pp-zshfringe))))
   `(region ((t (:background ,pp-select-bg :foreground ,pp-fg))))
   `(secondary-selection ((t (:background ,pp-literal :foreground ,pp-bg))))
   `(highlight ((t (:background ,pp-select-bg))))
   `(shadow ((t (:foreground ,pp-gray-mid))))
   `(minibuffer-prompt ((t (:foreground ,pp-comment))))
   `(link ((t (:foreground ,pp-preproc :underline t))))
   `(link-visited ((t (:foreground ,pp-keyword :underline t))))

   ;; --- Search -------------------------------------------------------
   `(isearch ((t (:background ,pp-fg :foreground ,pp-bg))))
   `(lazy-highlight ((t (:background ,pp-linenum :foreground ,pp-bg))))
   `(match ((t (:background ,pp-literal :foreground ,pp-bg))))

   ;; --- Line numbers -----------------------------------------------
   `(line-number ((t (:foreground ,pp-linenum))))
   `(line-number-current-line ((t (:foreground ,pp-cyan :background ,pp-gray-dim :weight bold))))

   ;; --- Windows / mode line -------------------------------------------
   ;; mode-line/popup/error keep a dark, saturated background as an accent
   ;; bar even in the light theme, so their text stays pp-bg (white)
   ;; rather than pp-fg (now dark) -- dark-on-dark would be illegible.
   `(mode-line ((t (:background ,pp-modeline :foreground ,pp-bg))))
   `(mode-line-inactive ((t (:background ,pp-gray-dim :foreground ,pp-gray-mid))))
   `(vertical-border ((t (:background ,pp-fg :foreground ,pp-gray-mid))))
   `(header-line ((t (:background ,pp-fg :foreground ,pp-fg))))
   `(mode-line-buffer-id ((t (:foreground ,pp-bg))))
   `(outline-1 ((t (:foreground ,pp-fg))))

   ;; --- Messages ---------------------------------------------------
   `(success ((t (:foreground ,pp-comment :weight bold))))
   `(warning ((t (:foreground ,pp-literal :weight bold))))
   `(error ((t (:background ,pp-literal :foreground ,pp-bg :weight bold))))
   `(trailing-whitespace ((t (:background ,pp-literal))))
   `(popup-tip-face ((t (:background ,pp-modeline :foreground ,pp-bg))))

   ;; --- Misc widgets -------------------------------------------------
   `(widget-field ((t (:background ,pp-gray-dim :foreground ,pp-fg))))
   `(hs-face ((t (:background ,pp-folded-bg :foreground ,pp-linenum))))
   `(hs-fringe-face ((t (:background ,pp-gray-dim :foreground ,pp-comment))))

   ;; --- Syntax highlighting -----------------------------------------
   ;; Comments
   `(font-lock-comment-face ((t (:foreground ,pp-comment))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,pp-comment))))
   `(font-lock-doc-face ((t (:foreground ,pp-comment))))
   ;; Strings / numbers / booleans -- one orange in the screenshot
   `(font-lock-constant-face ((t (:foreground ,pp-cyan))))
   `(font-lock-string-face ((t (:foreground ,pp-literal))))
   ;; Keywords and type names share the sampled green
   `(font-lock-keyword-face ((t (:foreground ,pp-keyword))))
   `(font-lock-type-face ((t (:foreground ,pp-blue))))
   `(font-lock-builtin-face ((t (:foreground ,pp-fg))))
   `(font-lock-negation-char-face ((t (:foreground ,pp-cyan))))
   `(font-lock-extra-types ((t (:foreground ,pp-cyan))))
   ;; Preprocessor directives
   `(font-lock-preprocessor-face ((t (:foreground ,pp-preproc))))
   ;; Functions and variables were plain white in the screenshot -- now
   ;; plain dark, the light-theme equivalent
   `(font-lock-function-name-face ((t (:foreground ,pp-fg))))
   `(font-lock-variable-name-face ((t (:foreground ,pp-fg))))
   `(font-lock-warning-face ((t (:background ,pp-literal :foreground ,pp-bg))))

   ;; --- Diff ------------------------------------------------------
   `(diff-added ((t (:background ,pp-comment-tint :foreground ,pp-comment :weight bold))))
   `(diff-removed ((t (:background ,pp-literal-tint :foreground ,pp-literal :weight bold))))
   `(diff-changed ((t (:background ,pp-preproc-tint :foreground ,pp-preproc :weight bold))))
   `(diff-refine-changed ((t (:background ,pp-preproc :foreground ,pp-bg :weight bold))))
   `(diff-header ((t (:background ,pp-gray-dim :foreground ,pp-linenum))))
   `(diff-file-header ((t (:background ,pp-gray-dim :foreground ,pp-preproc :weight bold))))

   ;; --- Parens -----------------------------------------------------
   `(show-paren-match ((t (:background ,pp-vscodeline :foreground ,pp-bg))))
   `(show-paren-mismatch ((t (:background ,pp-literal :foreground ,pp-bg))))

   `(hl-line ((t (:background ,pp-gray-dim))))

   ))

(provide-theme 'peachpuff-vs-light)

;;; peachpuff-vs-light-theme.el ends here
