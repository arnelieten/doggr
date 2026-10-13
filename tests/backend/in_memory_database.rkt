#lang racket

(require rackunit racket/class "../../backend/in_memory_database.rkt")

(test-case "test crud operations on in memory database"
  (define database (new in-memory-database%))
  (send database create! 1 '("Rex" 7 ("walking" "frisbee-catching") "steady"))
  (check-equal? (send database read 1) '("Rex" 7 ("walking" "frisbee-catching") "steady"))
  (send database update! 1 '("Rex" 8 ("walking" "swimming") "casual"))
  (check-equal? (send database read 1) '("Rex" 8 ("walking" "swimming") "casual"))
  (send database delete! 1)
  (check-false (send database read 1)))
