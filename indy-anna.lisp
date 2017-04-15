;;;; indy-anna.lisp

(in-package #:indy-anna)

;;; "indy-anna" goes here. Hacks and glory await!

(init)


(defevent clinch:*on-idle* ()
  
  (step-physics (/ 1 60 2))
  (format t "~A~%" *delta-ticks*)
  
  (*default-on-idle*)) 


(!
  (init-physics)
  
  (setf (children *root*) nil)
  (gl:clear-color 1 1 1 1)
  (setf *player* (make-instance 'node :parent *root* :name "player"))
  (!s *player* .5 .5 .5)
  
  (setf *orange-rotate-arrow* (make-instance 'node :parent *player* :name "orange-rotate-arrow"))
  (setf *player-orange-arrow* (make-instance 'node :parent *orange-rotate-arrow* :name "orange-arrow"))

  (setf *player-body* (make-instance 'node :parent *player* :name "player-body"))
  (setf *player-blue-arrow* (make-instance 'node :parent *player-body* :name "blue-arrow"))

  
  (setf *player-blue-arrow-texture* 
	(nth-value 1 (make-quad-for-image (get-local-path "assets/img/arrow-blue.png") :parent *player-blue-arrow*)))
  (setf *player-orange-arrow-texture*
	(nth-value 1 (make-quad-for-image (get-local-path "assets/img/arrow-orange.png") :parent *player-orange-arrow*)))

  (setf *player-body-texture*
	(nth-value 1 (make-quad-for-image (get-local-path "assets/img/girl01.png") :parent *player-body*)))
	      

  (setf *controls* (make-hash-table)))

    
	    
	      
	  

