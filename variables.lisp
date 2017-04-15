;;;; indy-anna.lisp

(in-package #:indy-anna)

(defconstant +max-axis+ 32767)
(defconstant +joy-cutoff+ .2)

(defparameter +vwidth+ (* 800 2))
(defparameter +vheight+ (* 600 2))

(defparameter *controls* nil)
(defparameter +j0+ (v! 0 0))
(defparameter +j1+ (v! 0 0))

(defparameter cspace nil)
(defparameter ground nil)

(defparameter *player* nil)
(defparameter *player-body* nil)
(defparameter *player-blue-arrow* nil)
(defparameter *player-orange-arrow* nil)

(defparameter *player-body-texture* nil)
(defparameter *player-blue-arrow-texture* nil)
(defparameter *player-orange-arrow-texture* nil)
(defparameter *orange-rotate-arrow* nil)

(defparameter *player-physics-body* nil)
(defparameter *player-physics-shape* nil)
