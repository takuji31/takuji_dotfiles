(require 'gist)

;; open-junk-file
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m/%Y-%m-%d-%H%M%S.")

(require 'text-translator)
(setq text-translator-auto-selection-func 'text-translator-translate-by-auto-selection-enja)