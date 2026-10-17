#lang racket

(require racket/class uuid "database_handler.rkt" "../common/dog_profile.rkt")

(provide process-orchestrator%)

(define process-orchestrator%
  (class object%
    (init-field database-handler)
    (super-new)

    (define/public (create-dog-profile! profile-fields)
      (send database-handler create-profile!
            (initialize-dog-profile (uuid-string)
                                    (hash-ref profile-fields 'name)
                                    (hash-ref profile-fields 'age)
                                    (hash-ref profile-fields 'hobbies)
                                    (hash-ref profile-fields 'relation)))
      'saved)))
