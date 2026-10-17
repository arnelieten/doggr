#lang racket

(require racket/gui/base)

(provide create-profile-screen%)


(define create-profile-screen%
  (class vertical-panel%
    (init-field on-submit)
    (super-new)

    (define name-field (new text-field% [parent this] [label "Name"]))
    (define age-field (new text-field% [parent this] [label "Age"]))
    (define hobbies-field (new text-field% [parent this] [label "Hobbies"]))
    (define relation-field (new text-field% [parent this] [label "Relation"]))

    (define (collect-fields)
      (hash 'name (send name-field get-value)
            'age (send age-field get-value)
            'hobbies (send hobbies-field get-value)
            'relation (send relation-field get-value)))

    (define (handle-submit-click button event)
      (on-submit (collect-fields)))

    (new button% [parent this] [label "Submit"] [callback handle-submit-click])))
