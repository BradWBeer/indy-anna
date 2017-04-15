;;;; indy-anna.asd

(asdf:defsystem #:indy-anna
  :description "Describe indy-anna here"
  :author "Brad (warweasle) Beer"
  :license "Specify license here"
  :depends-on (#:clinch
               #:clinch-cairo
               #:clinch-pango
               #:clinch-freeimage
               #:cl-chipmunk)
  :serial t
  :components ((:file "package")
               (:file "variables")
	       (:file "utils")
	       (:file "controls")
	       (:file "physics")
	       (:file "indy-anna")))

