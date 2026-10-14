#lang racket

(require rackunit racket/class "../../backend/in_memory_database.rkt")

(test-case "test crud operations on in memory database"
  (define database (new in-memory-database%))
  (define young-rex (hash 'name "Rex" 'age 7 'hobbies '("walking" "frisbeecatching") 'relation "steady"))
  (define old-rex (hash 'name "Rex" 'age 8 'hobbies '("walking" "frisbeecatching") 'relation "steady"))
  (send database create! 1 young-rex)
  (check-equal? (send database read 1) young-rex)
  (send database update! 1 old-rex)
  (check-equal? (send database read 1) old-rex)
  (send database delete! 1)
  (check-false (send database read 1)))
