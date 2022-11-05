(defclass hold-robot
  :super cascaded-link
  :slots (l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 ballbeam j0 j1 j2 j3))
(defmethod hold-robot
  (:init
   (&rest args)
   (send-super* :init args)
   (let (l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 ball beam ballbeam)
     (setq l0 (make-cylinder 15 10))
     (send l0 :set-color :darkred)
     (send l0 :translate (float-vector 0 0 0))
     (setq l0
	   (instance bodyset-link :init (make-cascoords :pos #f(0 0 0))
		     :bodies (list l0)))

     (setq l1 (make-cylinder 15 50))
     (send l1 :translate (float-vector 0 0 10))
     (setq l1
           (instance bodyset-link :init (make-cascoords :pos #f(0 0 10))
                     :bodies (list l1)))

     (setq l2 (make-cylinder 12 40))
     (send l2 :set-color :darkred)
     (send l2 :translate (float-vector 0 0 60))
     (setq l2
           (instance bodyset-link :init (make-cascoords :pos #f(0 0 60))
                     :bodies (list l2)))

     (setq l3 (make-cylinder 10 30))
     (send l3 :translate (float-vector 0 0 100))
     (setq l3
	   (instance bodyset-link :init (make-cascoords :pos #f(0 0 100))
		     :bodies (list l3)))


     (setq l4 (make-cylinder 5 100))
     (send l4 :set-color :dimgray)
     (send l4 :rotate (deg2rad -90) :x)
     (send l4 :translate (float-vector 0 -130 0))
     (setq l4
	   (instance bodyset-link :init (make-cascoords :pos #f(0 0 130))
		     :bodies (list l4)))

     (setq l5 (make-cube 5 5 20))
     (send l5 :translate #f(0 100 140))
     (setq l5 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 130))
		     :bodies (list l5)))

     (setq l6 (make-cube 5 5 10))
     (send l6 :translate (float-vector 0 100 155))
     (send l6 :set-color :darkred)
     (setq l6 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 150))
		     :bodies (list l6)))


     (setq l7 (make-cube 5 5 20))
     (send l7 :translate #f(0 100 140))
     (setq l7 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 130))
		     :bodies (list l7)))

     (setq l8 (make-cube 5 5 10))
     (send l8 :translate (float-vector 0 100 155))
     (send l8 :set-color :darkred)
     (setq l8 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 150))
		     :bodies (list l8)))

     (setq l9 (make-cube 5 5 20))
     (send l9 :translate #f(0 100 140))
     (setq l9 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 130))
		     :bodies (list l9)))

     (setq l10 (make-cube 5 5 10))
     (send l10 :translate (float-vector 0 100 155))
     (send l10 :set-color :darkred)
     (setq l10 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 150))
		     :bodies (list l10)))

     (setq ball (make-icosahedron 10.0))
     (send ball :translate (float-vector 0 120 130))
     (send ball :set-color :red)
     (setq beam (make-cube 5 300 5))
     (send beam :translate (float-vector 0 285 130))
     (send beam :set-color :red)  
     (send ball :assoc beam)
     (setq ballbeam 
	   (instance bodyset-link :init (make-cascoords :pos #f(0 100 130))
		     :bodies (list ball beam)))

     (setq end-coords (make-cascoords :pos #f(0 100 130) :parent l4))
     

     (send l4 :assoc end-coords)
     (send l9 :assoc l10)
     (send l7 :assoc l8)
     (send l5 :assoc l6)
     (send l4 :assoc ballbeam)
     (send l4 :assoc l9)
     (send l4 :assoc l7)
     (send l4 :assoc l5)
     (send l3 :assoc l4)
     (send l2 :assoc l3)
     (send l1 :assoc l2)
     (send l0 :assoc l1)
     (send self :assoc l0)

     (send l6 :rotate (deg2rad -60) :x)
     (send l8 :rotate (deg2rad -60) :x)
     (send l10 :rotate (deg2rad -60) :x)

     (send l7 :rotate (deg2rad 120) :y)
     (send l9 :rotate (deg2rad -120) :y)

     (setq j0
	   (instance rotational-joint :init
		     :parent-link l0
		     :child-link l1
		     :axis :z
		     :min -180 :max 180))
     (setq j1
           (instance rotational-joint :init
                     :parent-link l1
                     :child-link l2
                     :axis :x
		     :min -120 :max 120))
     (setq j2 
	   (instance rotational-joint :init
		     :parent-link l2
		     :child-link l3
		     :axis :y
		     :min -120 :max 120))
     (setq j3
	   (instance rotational-joint :init
		     :parent-link l3
		     :child-link l4
		     :axis :x
		     :min -180 :max 180))
   
     (setq links (list l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 ballbeam))
     (setq joint-list (list j0 j1 j2 j3))

     (send self :init-ending)
     )
   self)
  (:j0 (&rest args) (forward-message-to j0 args))
  (:j1 (&rest args) (forward-message-to j1 args))
  (:j2 (&rest args) (forward-message-to j2 args))
  (:j3 (&rest args) (forward-message-to j3 args))
  (:end-coords (&rest args) (forward-message-to end-coords args))
  )

(setq r (instance hold-robot :init))
(objects (list r))
(dotimes (i 2000)
  (send r :j0 :joint-angle (* -90 (sin (/ i 100.0))))
  (send r :j1 :joint-angle (* -30 (sin (/ i 40.0))))
  (send r :j2 :joint-angle (* 30 (sin (/ i 80.0))))
  (send r :j3 :joint-angle (* 30 (sin (/ i 50.0))))

  (send *irtviewer* :draw-objects))


(setq c (make-cascoords :pos #f(75 100 130)))
(send r :inverse-kinematics c :link-list (send r :link-list (send r :end-coords :parent)) :move-target (send r :end-coords) :translation-axis t :rotation-axis nil)
(send *irtviewer* :draw-objects)

