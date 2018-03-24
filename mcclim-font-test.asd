;;;; mcclim-font-test.asd

(asdf:defsystem #:mcclim-font-test
  :description "A demo of McCLIM true-type font"
  :author "Nisar Ahmad"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:mcclim)
  :components ((:file "package")
               (:file "mcclim-font-test")))
