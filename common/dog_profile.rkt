#lang racket

;; dog profile is the required information for creating a profile on doggr.
;; Shared between client and server.

(provide initialize-dog-profile
         dog-profile?
         dog-profile-id
         dog-profile-name
         dog-profile-age
         dog-profile-hobbies
         dog-profile-relation)


(struct dog-profile (id name age hobbies relation))

(define (initialize-dog-profile id name age hobbies relation)
  (dog-profile id name age hobbies relation))

