extends CharacterBody2D
enum {
	IDLE,
	NEW_DIR,
	MOVE
}
# Default Move Speed for Player Sprite
var SPEED: float = 50.0
var current_state = IDLE
var dir = Vector2.RIGHT
var start_pos
var is_roaming = true
@onready var ray = $"Wall Detect"

func _ready():
	randomize()
	start_pos = position
	ray.set_target_position(dir * 50)

func _process(delta):
	if is_roaming:
		match current_state:
			IDLE:
				$AnimatedSprite2D.play("Idle")
			NEW_DIR:
				$AnimatedSprite2D.play("Idle")
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN, Vector2.ZERO]) + choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN, Vector2.ZERO])
			MOVE:
				$AnimatedSprite2D.play("Walking")
				if dir.x < 0 and $AnimatedSprite2D.flip_h == false:
					$AnimatedSprite2D.flip_h = true
				elif dir.x > 0 and $AnimatedSprite2D.flip_h == true:
					$AnimatedSprite2D.flip_h = false
				move(delta)
	if ray.is_colliding():
		current_state = NEW_DIR
		ray.set_target_position(Vector2.ZERO)
func choose(array):
	array.shuffle()
	return array.front()
func move(delta):
	position += dir * SPEED * delta
	ray.set_target_position(dir * 50)
func _on_timer_timeout():
	$Timer.wait_time = randf_range(.5, 1.5)
	current_state = choose([IDLE, NEW_DIR, MOVE])
