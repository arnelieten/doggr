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
      (define profile-fields (raw-fields->profile-fields raw-fields))
      (if (hash-ref profile-fields 'age)
          (send-to-process-orchestrator profile-fields)
          'invalid-age))))
