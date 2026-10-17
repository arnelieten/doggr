#lang racket

(require racket/class)

(provide client-orchestrator%)

(define client-orchestrator%
  (class object%
    (init-field send-to-process-orchestrator)
    (super-new)
    (define (raw-fields->profile-fields raw-fields)
      (hash-update raw-fields 'age string->number))

    (define (incomplete? raw-fields)
      (member "" (hash-values raw-fields)))

    (define/public (submit-dog-profile! raw-fields)
      (define profile-fields (raw-fields->profile-fields raw-fields))
      (cond
        [(incomplete? raw-fields) 'incomplete-profile]
        [(not (hash-ref profile-fields 'age)) 'invalid-age]
        [else (send-to-process-orchestrator profile-fields)]))))
