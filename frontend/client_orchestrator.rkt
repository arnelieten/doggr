#lang racket

(require racket/class)

(provide client-orchestrator%)

(define client-orchestrator%
  (class object%
    (init-field send-to-process-orchestrator)
    (super-new)
    (define (raw-fields->profile-fields raw-fields)
      (hash-update raw-fields 'age string->number))

    (define/public (submit-dog-profile! raw-fields)
      (send-to-process-orchestrator (raw-fields->profile-fields raw-fields)))))
