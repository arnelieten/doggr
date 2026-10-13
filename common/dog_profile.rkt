#lang racket

(provide initialize-dog-profile
         dog-profile?
         dog-profile-id
         dog-profile-name
         dog-profile-age
         dog-profile-hobbies
         dog-profile-relation)


(struct dog-profile (id name age hobbies relation))

; TODO: think about argument validation and raising
; TODO: implement unittest to test creation of the dog-profile.
(define (initialize-dog-profile id name age hobbies relation)
  (dog-profile id name age hobbies relation))

