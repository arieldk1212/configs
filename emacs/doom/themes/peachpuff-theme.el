;;; peachpuff-theme.el

(deftheme peachpuff "peachpuff")

(let ((pp-bg          "#1C1C1C")   ; sampled background
      (pp-fg          "#FFFFFF")   ; sampled default text / variables
      (pp-comment     "#55F037")   ; sampled comment green
      (pp-preproc     "#DC4AE0")   ; sampled preprocessor pink
      (pp-keyword     "#4EBE36")   ; sampled keyword/type green
      (pp-literal     "#CC4631")   ; sampled string/number/bool orange
      (pp-linenum     "#b8b839")   ; sampled line-number olive
      ;; Derived/muted tones for structural faces the screenshot didn't
      ;; show (selection, mode-line, diff) -- built from the palette
      ;; above rather than introduced from elsewhere.
      (pp-gray-dim    "#303030")   ; sampled neutral (widget/box bg)
      (pp-gray-mid    "#909090")   ; sampled neutral (muted text)
      (pp-select-bg   "#383838")
      (pp-comment-dk  "#1F3D18")   ; darkened comment green, for diff bg
      (pp-literal-dk  "#3D1F16")   ; darkened literal orange, for diff bg
      (pp-preproc-dk  "#3D1A3D")   ; darkened preproc pink, for diff bg
      (pp-folded-bg   "#3A3A20"))  ; darkened line-number olive, for folds

  (custom-theme-set-faces
   'peachpuff

   ;; --- Basic / UI faces --------------------------------------------
   `(default ((t (:background ,pp-bg :foreground ,pp-fg))))
   `(cursor ((t (:background ,pp-fg :foreground ,pp-bg))))
   `(fringe ((t (:background ,pp-bg :foreground ,pp-fg))))
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
   `(line-number-current-line ((t (:foreground ,pp-linenum :weight bold))))

   ;; --- Windows / mode line -------------------------------------------
   `(mode-line ((t (:background ,pp-bg :foreground ,pp-fg))))
   `(mode-line-inactive ((t (:background ,pp-gray-dim :foreground ,pp-gray-mid))))
   `(vertical-border ((t (:background ,pp-fg :foreground ,pp-gray-mid))))
   `(header-line ((t (:background ,pp-fg :foreground ,pp-fg))))
   `(mode-line-buffer-id ((t (:foreground ,pp-fg))))
   `(outline-1 ((t (:foreground ,pp-fg))))

   ;; --- Messages ---------------------------------------------------
   `(success ((t (:foreground ,pp-comment :weight bold))))
   `(warning ((t (:foreground ,pp-literal :weight bold))))
   `(error ((t (:background ,pp-literal :foreground ,pp-fg :weight bold))))
   `(trailing-whitespace ((t (:background ,pp-literal))))

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
   `(font-lock-constant-face ((t (:foreground ,pp-fg))))
   `(font-lock-string-face ((t (:foreground ,pp-literal))))
   ;; Keywords and type names share the sampled green
   `(font-lock-keyword-face ((t (:foreground ,pp-keyword))))
   `(font-lock-type-face ((t (:foreground ,pp-keyword))))
   `(font-lock-builtin-face ((t (:foreground ,pp-keyword))))
   `(font-lock-negation-char-face ((t (:foreground ,pp-literal))))
   ;; Preprocessor directives
   `(font-lock-preprocessor-face ((t (:foreground ,pp-preproc))))
   ;; Functions and variables were plain white in the screenshot
   `(font-lock-function-name-face ((t (:foreground ,pp-fg))))
   `(font-lock-variable-name-face ((t (:foreground ,pp-fg))))
   `(font-lock-warning-face ((t (:background ,pp-literal :foreground ,pp-fg))))

   ;; --- Diff ------------------------------------------------------
   `(diff-added ((t (:background ,pp-comment-dk :foreground ,pp-comment :weight bold))))
   `(diff-removed ((t (:background ,pp-literal-dk :foreground ,pp-literal :weight bold))))
   `(diff-changed ((t (:background ,pp-preproc-dk :foreground ,pp-preproc :weight bold))))
   `(diff-refine-changed ((t (:background ,pp-preproc :foreground ,pp-bg :weight bold))))
   `(diff-header ((t (:background ,pp-gray-dim :foreground ,pp-linenum))))
   `(diff-file-header ((t (:background ,pp-gray-dim :foreground ,pp-preproc :weight bold))))

   ;; --- Parens -----------------------------------------------------
   `(show-paren-match ((t (:background ,pp-fg :foreground ,pp-bg))))
   `(show-paren-mismatch ((t (:background ,pp-literal :foreground ,pp-fg))))

   ))

(provide-theme 'peachpuff)

;;; peachpuff-theme.el ends here
