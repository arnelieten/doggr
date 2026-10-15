#lang racket

(require racket/gui/base "screens.rkt")

(provide main-window%)

(define main-window%
  (class object%
    (super-new)

    (define frame (new frame% [label "Doggr"] [width 800] [height 400]))

    (define screens
      (hash 'create-profile (new create-profile-screen% [parent frame])))

    (define/public (show-screen! screen-name)
      (for ([screen (send frame get-children)])
        (send frame delete-child screen))
      (send frame add-child (hash-ref screens screen-name)))

    (define/public (open-window!)
      (show-screen! 'create-profile)
      (send frame show #t))

    (define/public (close-window!)
      (send frame show #f))))
