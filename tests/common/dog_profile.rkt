#lang racket

(require rackunit "../../common/dog_profile.rkt")

(test-case "initialize dog-profile with valid arguments"
  (define test-dog-profile (initialize-dog-profile 1 "Rex" 7 '("walking" "frisbee-catching") "steady"))
  (check-true (dog-profile? test-dog-profile))
  (check-equal? (dog-profile-id test-dog-profile) 1)
  (check-equal? (dog-profile-name test-dog-profile) "Rex")
  (check-equal? (dog-profile-age test-dog-profile) 7)
  (check-equal? (dog-profile-hobbies test-dog-profile) '("walking" "frisbee-catching"))
  (check-equal? (dog-profile-relation test-dog-profile) "steady"))
