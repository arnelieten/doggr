#lang racket

;; Orchestrates the different screens, in phase 1 only the profile creation screen.
;; In later phases will manage the different screns.

(require racket/gui/base "screens.rkt")

(provide main-window%)

(define main-window%
  (class object%
    (init-field on-profile-submit)
    (super-new)

    (define frame (new frame% [label "Doggr"] [width 800] [height 400]))

    (define screens
      (hash 'create-profile (new create-profile-screen%
                              [parent frame]
                              [on-submit on-profile-submit])))

    (define/public (show-screen! screen-name)
      (for ([screen (send frame get-children)])
        (send frame delete-child screen))
      (send frame add-child (hash-ref screens screen-name)))

    (define/public (open-window!)
      (show-screen! 'create-profile)
      (send frame show #t))

    (define/public (close-window!)
      (send frame show #f))))
