;;; evil-moccur.el --- Intergrate evil with color-moccur.el

;;; Commentary:
;; 

;;; Code:
;;

(require 'evil)

(evil-define-state moccur
  "color-moccur state."
  :tag "<M>"
  :message "-- MOCCUR --"
  :enable (motion))

(define-minor-mode evil-moccur-mode
  "Evil with color-moccur."
  :lighter "EMo"
  :keymap (make-sparse-keymap)
  :global t
  (if evil-moccur-mode
      (progn
        (evil-define-key 'normal evil-moccur-mode-map (kbd "<escape>")
              (lambda () "Enable `evil-moccur-state' and display message." (interactive) (evil-moccur-state 1)))
        (evil-define-key 'moccur evil-moccur-mode-map (kbd "<escape>")
              (lambda () "Enable `evil-moccur-state' and display message." (interactive) (evil-moccur-state 1)))
        (advice-add 'moccur-mode :after (lambda (&rest _) "Enter `evil-moccur-state'." (evil-moccur-state))))
    (advice-remove 'moccur-mode #'evil-moccur-state)))


(define-key evil-moccur-state-map "e" 'moccur-toggle-buffer)
(define-key evil-moccur-state-map "\C-c\C-c" 'moccur-mode-goto-occurrence)
(define-key evil-moccur-state-map "\C-m" 'moccur-mode-goto-occurrence)
(define-key evil-moccur-state-map "d" 'moccur-kill-line)
(define-key evil-moccur-state-map "\C-k" 'moccur-kill-line)
(define-key evil-moccur-state-map "\M-d" 'moccur-mode-kill-file)
(define-key evil-moccur-state-map "/" 'moccur-mode-undo)
;;(define-key map "f" 'moccur-flush-lines) ;; M-x
;;(define-key map "" 'moccur-keep-lines) ;; M-x
(define-key evil-moccur-state-map "q" 'moccur-quit)
(define-key evil-moccur-state-map "n" 'moccur-next)
(define-key evil-moccur-state-map "p" 'moccur-prev)
(define-key evil-moccur-state-map "j" 'moccur-next)
(define-key evil-moccur-state-map "k" 'moccur-prev)
(define-key evil-moccur-state-map '[wheel-down] 'moccur-next)
(define-key evil-moccur-state-map '[wheel-up] 'moccur-prev)
(define-key evil-moccur-state-map "s" 'moccur-narrow-down)
(define-key evil-moccur-state-map "u" 'moccur-search-undo)
(define-key evil-moccur-state-map "g" 'moccur-search-update)
(define-key evil-moccur-state-map '[down] 'moccur-next)
(define-key evil-moccur-state-map '[up] 'moccur-prev)
(define-key evil-moccur-state-map "t" 'moccur-toggle-view)
(define-key evil-moccur-state-map "b" 'moccur-file-scroll-down)
(define-key evil-moccur-state-map " " 'moccur-file-scroll-up)
;;     (define-key map "b" 'moccur-scroll-down)
;;     (define-key map " " 'moccur-scroll-up)
(define-key evil-moccur-state-map "\M-v" 'moccur-scroll-down)
(define-key evil-moccur-state-map "\C-v" 'moccur-scroll-up)
(define-key evil-moccur-state-map "h" 'moccur-next-file)
(define-key evil-moccur-state-map "l" 'moccur-prev-file)
(define-key evil-moccur-state-map "\M-n" 'moccur-next-file)
(define-key evil-moccur-state-map "\M-p" 'moccur-prev-file)
(define-key evil-moccur-state-map '[M-wheel-down] 'moccur-next-file)
(define-key evil-moccur-state-map '[M-wheel-up] 'moccur-prev-file)

(define-key evil-moccur-state-map '[down-mouse-1] 'moccur-mouse-select1)

(define-key evil-moccur-state-map "<" 'moccur-file-beginning-of-buffer)
(define-key evil-moccur-state-map ">" 'moccur-file-end-of-buffer)

(condition-case nil
    (progn
      (require 'moccur-edit)
      (define-key evil-moccur-state-map "i" 'moccur-edit-mode-in)

      (define-key evil-moccur-state-map "\C-x\C-q" 'moccur-edit-mode-in)
      (define-key evil-moccur-state-map "\C-c\C-i" 'moccur-edit-mode-in))
  (error
   nil))

(provide 'evil-moccur)

;;; evil-moccur.el ends here
