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

    (define (submit-result->text submit-result)
      (cond
        [(eq? submit-result 'saved) "Profile saved"]
        [(eq? submit-result 'incomplete-profile) "Please fill in all fields"]
        [(eq? submit-result 'invalid-age) "Age must be a number"]
        [else "Something went wrong"]))

    (define (handle-submit-click button event)
      (send status-message set-label (submit-result->text (on-submit (collect-fields)))))

    (new button% [parent this] [label "Submit"] [callback handle-submit-click])

    (define status-message (new message% [parent this] [label ""] [auto-resize #t]))))
