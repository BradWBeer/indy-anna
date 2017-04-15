(in-package #:indy-anna)


(defun get-node-entity (n)
  (uniform (first (children n)) "t1"))

(defun max-vector (v)
  (if (< 1 (v:length v))
      v
      (v:normalize v)))

(defevent *on-window-resized* (window width height ts)
  (let* ((m (max (float (/ +vwidth+ width))
                 (float (/ +vheight+ height))))
         (w (* width m))
         (h  (* height m)))
    (format t "w=~A h=~A min=~A~%" width height m)
    (setf *projection*
	  (setf *ortho-projection*
		(make-orthogonal-transform w h 0 1000)))))



(defun vec->rot (vec)
  (r->d (atan (elt vec 0) 
	      (elt vec 1))))

(defun joy-val (axis)
  (or (gethash axis *controls*) 0))


(defun squish-arrow (node texture x y z depth)
  (!s node
       x 
       y 
       z t)
  (!t node 0 (* y (height texture) 1/2) depth t) 
  )

(defun ceiling-vector (v)
  (if (> (v2:length v) 1)
      (v2:normalize v)
      v))

(defun floor-vector (v)
  (if (< (v2:length v) +joy-cutoff+)
      (v! 0 0)
      v))

(defun get-local-path (path)
  (concatenate 'string 
	       (directory-namestring
		(asdf:system-relative-pathname :indy-anna "indy-anna.asd"))
	       path))
		  
