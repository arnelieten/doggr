#lang racket

(require racket/class "../common/dog_profile.rkt")

(provide database-handler%)

(define database<%> (interface () create! read update! delete!))

(define database-handler%
  (class object%
    (init-field database)
    (super-new)

    (define/public (create-profile! profile)
      (send database create! (dog-profile-id profile) profile))

    ; TODO: handle id not existing in database
    (define/public (read-profile id)
      (define database-fields (send database read id))
      (initialize-dog-profile id database-fields))

    (define/public (update-profile! profile)
      (send database update! (dog-profile-id profile) profile))

    (define/public (delete-profile! id)
      (send database delete! id))))
