;; EXTRA CREDIT:
;;
;; Create a program that will play the Greed Game.
;; Rules for the game are in GREED_RULES.TXT.
;;
;; You already have a DiceSet class and score function you can use.
;; Write a player class and a Game class to complete the project.  This
;; is a free form assignment, so approach it however you desire.



(defclass player ()
  ((name :initarg :name)
   (score :accessor score :initform 0)))

(defmethod add-score ((object player) score)
  (incf (slot-value object 'score) score))


(defclass game ()
  ((players :initform nil)))

(defmethod add-player ((object game) player-name)
  (push (make-instance 'player :name player-name)
	(slot-value object 'players)))


(define-test test-player-creation
    (let ((new-player (make-instance 'player :name "Jacek")))
      (assert-equal "Jacek" (slot-value new-player 'name))
      (assert-equal 0 (slot-value new-player 'score))))

(define-test test-adding-score
    (let ((new-player (make-instance 'player :name "Jacek")))
      (add-score new-player 7)
      (assert-equal 7 (slot-value new-player 'score))))

(define-test test-game-creation
    (let ((new-game (make-instance 'game)))
      (assert-equal nil (slot-value new-game 'players))
      (add-player new-game "Jacek")
      (assert-equal "Jacek" (slot-value (first (slot-value new-game 'players)) 'name))
      (add-player new-game "Chris")
      (assert-equal "Chris" (slot-value (first (slot-value new-game 'players)) 'name))
      (assert-equal "Jacek" (slot-value (second (slot-value new-game 'players)) 'name))))
