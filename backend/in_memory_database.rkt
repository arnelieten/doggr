#lang racket

(require racket/class "database_handler.rkt")

(provide in-memory-database%)

(define in-memory-database%
  (class* object% (database<%>)
    (super-new)

    (define profiles (make-hash))

    (define/public (create! id fields)
      (hash-set! profiles id fields))
    ; TODO: implement error handling
    (define/public (read id)
      (hash-ref profiles id #f))

    (define/public (update! id fields)
      (hash-set! profiles id fields))

    (define/public (delete! id)
      (hash-remove! profiles id))))
