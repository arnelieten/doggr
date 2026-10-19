#lang racket

;; Sources:
;; - RackUnit: https://docs.racket-lang.org/rackunit/index.html
;; - mocking: https://martinfowler.com/articles/mocksArentStubs.html

(require rackunit racket/class "../../backend/database_handler.rkt" "../../common/dog_profile.rkt")

(define mock-database%
  (class* object% (database<%>)
    (super-new)
    (field [last-call #f])
    (define/public (create! id fields) (set! last-call 'create!))
    (define/public (read id) (set! last-call 'read) (hash 'name "Rex" 'age 7 'hobbies '("walking" "frisbeecatching") 'relation "steady"))
    (define/public (update! id fields) (set! last-call 'update!))
    (define/public (delete! id) (set! last-call 'delete!))))

(test-case "test crud operations on database handler"
  (define mock-database (new mock-database%))
  (define mock-dog-profile (initialize-dog-profile 1 "Rex" 7 '() "steady"))
  (define handler (new database-handler% [database mock-database]))

  (send handler create-profile! mock-dog-profile)
  (check-equal? (get-field last-call mock-database) 'create!)

  (send handler read-profile 1)
  (check-equal? (get-field last-call mock-database) 'read)

  (send handler update-profile! mock-dog-profile)
  (check-equal? (get-field last-call mock-database) 'update!)

  (send handler delete-profile! 1)
  (check-equal? (get-field last-call mock-database) 'delete!))
