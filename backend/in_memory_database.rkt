#lang racket

(require racket/class "database_handler.rkt")

(provide in-memory-database% (struct-out exn:profile-not-found))

(struct exn:profile-not-found exn:fail ())

(define in-memory-database%
  (class* object% (database<%>)
    (super-new)

    (define profiles (make-hash))

    (define/public (create! id fields)
      (hash-set! profiles id fields))

    (define/public (read id)
      (if (hash-has-key? profiles id)
          (hash-ref profiles id)
          (raise (exn:profile-not-found "profile not found" (current-continuation-marks)))))

    (define/public (update! id fields)
      (hash-set! profiles id fields))

    (define/public (delete! id)
      (hash-remove! profiles id))))
