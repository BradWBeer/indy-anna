;;;; indy-anna.lisp

(in-package #:indy-anna)

(defparameter cspace nil)
(defparameter ground nil)

;; (defparameter ball-body nil)
;; (defparameter ball-shape nil)
;; (defparameter moment-of-inertia nil)

(defparameter dt 1/60)

(defun init-physics ()

  (setf cspace (chip:cp-space-new))
  (chip:cp-space-set-collision-slop cspace 2)
  (chip:cp-space-set-iterations cspace 5)

  )
;; (chip:cp-space-set-gravity cspace (v! 0 -100))

;; (setf ground
;;       (chip::cp-segment-shape-new (chip:cp-space-get-static-body cspace) 
;; 				 (v! -20 5) 
;; 				 (v! 20 -5) 
;; 				 0))

;; (chip:cp-shape-set-friction ground 1)
;; (chip:cp-space-add-shape cspace ground)
;; (setf moment-of-inertia 
;;       (chip:cp-moment-for-circle 1 0 5))

;; (setf ball-body 
;;       (chip:cp-space-add-body cspace 
;; 			      (chip:cp-body-new 1 moment-of-inertia))) 

;; (chip:cp-body-set-position ball-body (rtg-math:v! 0 10))



;; (setf ball-shape 
;;       (chip:cp-space-add-shape 
;;        cspace
;;        (chip:cp-circle-shape-new ball-body 5)))

;; (chip:cp-shape-set-friction ball-shape 0.7)

(autowrap:defcallback physics-callback :void ((cspace :pointer) (a :pointer) (b :pointer))
  ;; (c-let ((cspace
  ;; 	   (:struct (%chipmunk:cp-space)) :from cspace))
  
    (format t "Callback!~%")
    (cffi:null-pointer))

(defun step-physics ()
  
  ;; (format t "p=~A v=~A~%"
  ;; 	  (chip:cp-body-get-position ball-body)
  ;; 	  (chip:cp-body-get-velocity ball-body))
  (%chip:cp-space-add-post-step-callback cspace (autowrap:callback 'my-callback) (cffi:null-pointer) (cffi:null-pointer))
  (chip:cp-space-step cspace dt))

(defun unint-physics ()
  
  ;; (chip:cp-shape-free ball-shape)
  ;; (chip:cp-shape-free ground)
  ;; (chip:cp-body-free  ball-body)
  (chip:cp-space-free cspace))


