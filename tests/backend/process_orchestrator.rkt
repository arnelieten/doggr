#lang racket

(require rackunit racket/class "../../backend/process_orchestrator.rkt")

(define mock-database-handler%
  (class object%
    (super-new)
    (field [last-call #f])
    (define/public (create-profile! profile) (set! last-call 'create-profile!))))

(test-case "test create-dog-profile! on process orchestrator"
  (define mock-database-handler (new mock-database-handler%))
  (define orchestrator (new process-orchestrator% [database-handler mock-database-handler]))

  (send orchestrator create-dog-profile! (hash 'name "Rex" 'age 7 'hobbies '() 'relation "steady"))
  (check-equal? (get-field last-call mock-database-handler) 'create-profile!))
