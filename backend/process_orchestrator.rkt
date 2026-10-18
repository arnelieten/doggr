#lang racket

;; Main business logic in the server. In phase 1 very light to be extended in phases 2 & 3.

(require racket/class uuid "database_handler.rkt" "../common/dog_profile.rkt")

(provide process-orchestrator%)

(define process-orchestrator%
  (class object%
    (init-field database-handler)
    (super-new)

    (define/public (create-dog-profile! profile)
      (send database-handler create-profile!
            (initialize-dog-profile (uuid-string)
                                    (dog-profile-name profile)
                                    (dog-profile-age profile)
                                    (dog-profile-hobbies profile)
                                    (dog-profile-relation profile)))
      'saved)))
