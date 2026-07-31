;;; visual-assist-theme.el --- a dark theme inspired by Visual Assist / VS -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: you
;; Maintainer: you
;; Source: user-provided screenshot of Visual Assist / Visual Studio dark C++ highlighting
;;
;;; Commentary:
;;
;; A dark Doom theme that mimics the Visual Assist / Visual Studio dark
;; C/C++ color scheme: green italic comments, brownish-orange strings and
;; enum/macro constants, magenta control-flow keywords, blue built-in
;; types, gold library typedefs, olive/khaki variables & parameters, and
;; orange function names.
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup visual-assist-theme nil
  "Options for the `visual-assist' theme."
  :group 'doom-themes)

(defcustom visual-assist-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'visual-assist-theme
  :type 'boolean)

(defcustom visual-assist-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'visual-assist-theme
  :type 'boolean)

(defcustom visual-assist-comment-bg visual-assist-brighter-comments
  "If non-nil, comments will have a subtle highlight to enhance legibility."
  :group 'visual-assist-theme
  :type 'boolean)

(defcustom visual-assist-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'visual-assist-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme visual-assist
  "A dark theme inspired by Visual Assist / Visual Studio's C++ classifier colors."

  :family 'visual-assist
  :background-mode 'dark

  ;; name         gui        256        tty
  ((bg         '("#1E1E1E" "#1E1E1E" "black"))
   (bg-alt     '("#181818" "#181818" "black"))
   (fg         '("#D4D4D4" "#D4D4D4" "brightwhite"))
   (fg-alt     '("#9A9A9A" "#9A9A9A" "white"))

   (base0      '("#000000" "#000000" "black"))
   (base1      '("#161616" "#161616" "black"))
   (base2      '("#1E1E1E" "#1E1E1E" "brightblack"))
   (base3      '("#252526" "#252526" "brightblack"))
   (base4      '("#3C3C3C" "#3C3C3C" "brightblack"))
   (base5      '("#585858" "#585858" "brightblack"))
   (base6      '("#717171" "#717171" "brightblack"))
   (base7      '("#B4B4B4" "#B4B4B4" "white"))
   (base8      '("#FFFFFF" "#FFFFFF" "white"))

   (grey       base5)
   (red        '("#F44747" "#F44747" "red"))
   (orange     '("#FF8000" "#FF8000" "brightred"))
   (green      '("#57A64A" "#57A64A" "green"))
   (teal       '("#4EC9B0" "#4EC9B0" "brightgreen"))
   (yellow     '("#FFD700" "#FFD700" "yellow"))
   (blue       '("#569CD6" "#569CD6" "brightblue"))
   (dark-blue  '("#264F78" "#264F78" "blue"))
   (magenta    '("#D8A0DF" "#D8A0DF" "brightmagenta"))
   (violet     '("#BD63C5" "#BD63C5" "magenta"))
   (cyan       '("#9CDCFE" "#9CDCFE" "brightcyan"))
   (dark-cyan  (doom-darken teal 0.25))

   ;; theme-specific extras, named for what they map to in the screenshot
   (khaki      '("#BDB76B" "#BDB76B" "yellow"))   ; variables / parameters
   (rust       '("#B9771E" "#B9771E" "brightred")) ; enum values / macro-argument constants
   (salmon     '("#D69D85" "#D69D85" "brightred")) ; actual string literals
   (ltgreen    '("#B5CEA8" "#B5CEA8" "green"))     ; numeric literals

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; They *must* be included in every doom theme, or it will throw a
   ;; void-variable error, since doom-themes-base.el relies on all of them.
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      dark-blue)
   (builtin        violet)
   (comments       (if visual-assist-brighter-comments (doom-lighten green 0.1) green))
   (doc-comments   (doom-lighten (if visual-assist-brighter-comments (doom-lighten green 0.1) green) 0.25))
   (constants      rust)
   (functions      orange)
   ;; cc-mode's one keyword face covers class/public/private/static/
   ;; const/virtual/override/namespace as well as if/else/for/while.
   ;; The former dominate real OOP C++, and the reference screenshots
   ;; show all of those in blue, so default here to blue, not the
   ;; magenta/pink that only if/else showed in the CUDA sample.
   (keywords       blue)
   (methods        teal)
   (operators      base7)
   ;; cc-mode has exactly one face (font-lock-type-face) for both
   ;; primitive keywords (int/bool/void) AND user classes/structs
   ;; (Renderer, Logger, ComponentManager...). Real code is dominated by
   ;; the latter, so default the shared face to gold, not blue -- the
   ;; bonus tree-sitter section below still splits type.builtin=blue
   ;; from type=gold for setups that can tell the two apart.
   (type           yellow)
   (strings        salmon)
   (variables      khaki)
   (numbers        ltgreen)
   (region         `(,(doom-lighten (car dark-blue) 0.05) ,@(doom-lighten (cdr dark-blue) 0.05)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; extra vars used only within this theme
   (modeline-fg fg)
   (modeline-fg-alt base6)
   (modeline-bg (if visual-assist-brighter-modeline
                    (doom-darken blue 0.45)
                  (doom-darken bg-alt 0.1)))
   (modeline-bg-alt (if visual-assist-brighter-modeline
                        (doom-darken blue 0.475)
                      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))
   (-modeline-pad
    (when visual-assist-padded-modeline
      (if (integerp visual-assist-padded-modeline) visual-assist-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base6)
   ((line-number-current-line &override) :foreground fg)

   ((font-lock-comment-face &override)
    :slant 'italic
    :background (if visual-assist-comment-bg (doom-lighten bg 0.05) 'unspecified))
   ((font-lock-doc-face &override) :slant 'italic)
   ((font-lock-string-face &override) :slant 'italic)
   ((font-lock-constant-face &override) :slant 'italic)
   ((font-lock-type-face &override))
   ((font-lock-keyword-face &override))
   ((font-lock-builtin-face &override))
   ((font-lock-function-name-face &override))
   ;; function *calls* auto-inherit italic + a faded blend of `functions';
   ;; force the same solid orange used for the definition, to match the
   ;; reference screenshot where calls and defs share one color.
   ((font-lock-function-call-face &override) :foreground functions)
   ((font-lock-variable-use-face &override) :foreground variables)
   ;; font-lock-preprocessor-face is left at doom-themes-base's default
   ;; (:foreground operators, our neutral gray) -- the VS Assist reference
   ;; shows #include as plain gray, not the macro/mauve color.

   (show-paren-match :background dark-blue :foreground base8)
   (region :extend t)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if visual-assist-brighter-modeline base8 highlight))

   ;;;; company
   (company-tooltip :background bg-alt :foreground fg)
   (company-tooltip-selection :background dark-blue :foreground base8)
   (company-tooltip-common :foreground blue)
   (company-scrollbar-bg :background bg-alt)
   (company-scrollbar-fg :background dark-blue)

   ;;;; ivy / vertico
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   (vertico-current :background dark-blue :extend t)

   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))

   ;;;; Bonus: modern Emacs 29+ font-lock faces & tree-sitter captures.
   ;; Vanilla C/C++ mode can't tell a builtin type (int/void/bool/float)
   ;; apart from a typedef'd library type (size_t, uchar4, cudaFooDesc) --
   ;; both use `font-lock-type-face', so it's set to blue above. If your
   ;; Doom config uses tree-sitter fontification, these extra captures let
   ;; library typedefs render gold instead, closer to the screenshot.
   (font-lock-number-face :foreground numbers)
   (font-lock-operator-face :foreground operators)
   (tree-sitter-hl-face:type :foreground yellow :slant 'italic)
   (tree-sitter-hl-face:type.builtin :foreground blue)
   (tree-sitter-hl-face:function.call :foreground functions :slant 'italic)
   (tree-sitter-hl-face:method.call :foreground functions :slant 'italic)
   (tree-sitter-hl-face:variable.parameter :foreground variables)
   (tree-sitter-hl-face:property :foreground variables)
   (tree-sitter-hl-face:constant :foreground constants :slant 'italic)
   (tree-sitter-hl-face:keyword :foreground keywords)
   (tree-sitter-hl-face:operator :foreground operators))

  ;;;; Base theme variable overrides
  ())

;;; visual-assist-theme.el ends here
