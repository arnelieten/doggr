#lang racket

(require racket/gui/base)

(provide create-profile-screen%)


(define create-profile-screen%
  (class vertical-panel%
    (super-new)

    (new text-field% [parent this] [label "Name"])
    (new text-field% [parent this] [label "Age"])
    (new text-field% [parent this] [label "Hobbies"])
    (new text-field% [parent this] [label "Relation"])
    (new button% [parent this] [label "Submit"])))
