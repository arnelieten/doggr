#lang racket

(require rackunit racket/class "../../frontend/client_orchestrator.rkt" "../../common/dog_profile.rkt")

(define last-sent #f)

(define (mock-send-to-process-orchestrator profile)
  (set! last-sent profile)
  'saved)

(test-case "test submit-dog-profile! on client orchestrator"
  (define orchestrator (new client-orchestrator% [send-to-process-orchestrator mock-send-to-process-orchestrator]))
  (define rex (hash 'name "Rex" 'age "7" 'hobbies "walking" 'relation "steady"))

  (check-equal? (send orchestrator submit-dog-profile! rex) 'saved)
  (check-equal? (dog-profile-name last-sent) "Rex")
  (check-equal? (dog-profile-age last-sent) 7)

  (set! last-sent #f)
  (check-equal? (send orchestrator submit-dog-profile! (hash-set rex 'name "")) 'incomplete-profile)
  (check-equal? (send orchestrator submit-dog-profile! (hash-set rex 'age "seven")) 'invalid-age)
  (check-false last-sent))
