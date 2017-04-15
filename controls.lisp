(in-package #:indy-anna)


(defevent *on-controller-axis-move* (controller-id axis value ts)

  
    
    (setf (gethash axis *controls*) (-
				     (if (and (< value +joy-cutoff+)
					    (> value (- +joy-cutoff+)))
					 0
					 (float (/ value +max-axis+)))))
    
    (cond ((or (= axis 0)
	     (= axis 1)) (setf +j0+ 
			       (floor-vector
				(ceiling-vector
				 (v! (joy-val 0)
				     (joy-val 1))))))
	  ((or (= axis 2)
	       (= axis 3)) (setf +j1+ 
				 (floor-vector
				  (ceiling-vector
				   (v! (joy-val 2)
				       (joy-val 3)))))))
    
    
    (format t "~A ~A~%" +j0+ (v2:length +j0+))

    (squish-arrow *player-blue-arrow* *player-blue-arrow-texture* 1 (v2:length +j0+) 1 -2)
    (squish-arrow *player-orange-arrow* *player-orange-arrow-texture* 1 (v2:length +j1+) 1 -1)
    
    (when +j0+ (!r *player-body* (vec->rot +j0+) 0 0 1 t))
    (when +j1+ (!r *orange-rotate-arrow* (vec->rot +j1+) 0 0 1 t)))
