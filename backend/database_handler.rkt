#lang racket

(require racket/class "../common/dog_profile.rkt")

(provide database<%> database-handler%)

(define database<%> (interface () create! read update! delete!))


(define (profile->hash profile)
  (hash 'name (dog-profile-name profile)
        'age (dog-profile-age profile)
        'hobbies (dog-profile-hobbies profile)
        'relation (dog-profile-relation profile)))


(define database-handler%
  (class object%
    (init-field database)
    (super-new)

    (define/public (create-profile! profile)
      (send database create! (dog-profile-id profile) (profile->hash profile)))

    (define/public (read-profile id)
      (define fields (send database read id))
      (initialize-dog-profile id
                              (hash-ref fields 'name)
                              (hash-ref fields 'age)
                              (hash-ref fields 'hobbies)
                              (hash-ref fields 'relation)))

    (define/public (update-profile! profile)
      (send database update! (dog-profile-id profile) (profile->hash profile)))

    (define/public (delete-profile! id)
      (send database delete! id))))
