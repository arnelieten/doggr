#lang racket

(require racket/class
         "backend/in_memory_database.rkt"
         "backend/database_handler.rkt"
         "backend/process_orchestrator.rkt"
         "frontend/client_orchestrator.rkt"
         "frontend/main_window.rkt")

(define database (new in-memory-database%))
(define database-handler (new database-handler% [database database]))
(define process-orchestrator (new process-orchestrator% [database-handler database-handler]))

(define (send-to-process-orchestrator profile-fields)
  (send process-orchestrator create-dog-profile! profile-fields))

(define (open-client!)
  (define client-orchestrator
    (new client-orchestrator% [send-to-process-orchestrator send-to-process-orchestrator]))

  (define (submit-profile raw-fields)
    (send client-orchestrator submit-dog-profile! raw-fields))

  (define main-window (new main-window% [on-profile-submit submit-profile]))
  (send main-window open-window!))

(open-client!)
(open-client!)
(open-client!)
(open-client!)
