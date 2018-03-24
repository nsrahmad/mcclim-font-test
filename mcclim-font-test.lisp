;;;; mcclim-font-test.lisp

(in-package #:mcclim-font-test)

(define-application-frame test-app ()
  ()
  (:panes
   (app :application :height 400 :width 600
	:display-function #'display))
  (:layouts
   (default app)))

(defun display (frame pane)
  (declare (ignore frame))
  (with-text-style (pane (make-text-style "Hello Kitty" "Regular" 72))
    (format pane "Hello McCLIM")))

(defvar *fonts-loaded-p* nil)

(defun init-fonts ()
  (mcclim-truetype::register-all-ttf-fonts (find-port)
				       (asdf:system-relative-pathname
					"clim-test"
					"Fonts/"
					:type :directory))
  (setf *fonts-loaded-p* t))

(defun run-font-test ()
  (unless *fonts-loaded-p*
    (init-fonts))
  (run-frame-top-level (make-application-frame 'test-app)))
