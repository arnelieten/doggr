#lang racket

(require rackunit "../../common/dog_profile.rkt")

(test-case "initialize dog-profile with valid arguments"
  (define dog-profile (initialize-dog-profile 1 "Rex" 7 '("walking" "frisbee-catching") "steady"))
  (check-true (dog-profile? dog-profile))
  (check-equal? (dog-profile-id dog-profile) 1)
  (check-equal? (dog-profile-name dog-profile) "Rex")
  (check-equal? (dog-profile-age dog-profile) 7)
  (check-equal? (dog-profile-hobbies dog-profile) '("walking" "frisbee-catching"))
  (check-equal? (dog-profile-relation dog-profile) "steady"))
