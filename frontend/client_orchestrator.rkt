#lang racket

(require racket/class "../common/dog_profile.rkt")

(provide client-orchestrator%)

(define client-orchestrator%
  (class object%
    (init-field send-to-process-orchestrator)
    (super-new)
    (define (incomplete? raw-fields)
      (member "" (hash-values raw-fields)))

    (define/public (submit-dog-profile! raw-fields)
      (define age (string->number (hash-ref raw-fields 'age)))
      (cond
        [(incomplete? raw-fields) 'incomplete-profile]
        [(not age) 'invalid-age]
        [else (send-to-process-orchestrator
               (initialize-dog-profile #f (hash-ref raw-fields 'name) age
                                       (hash-ref raw-fields 'hobbies) (hash-ref raw-fields 'relation)))]))))
