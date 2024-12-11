extends Camera2D
@onready var player: CharacterBody2D = $".."
const smoothing = 0.01
const maxspeed = 0.01

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_position = player.position
	var distance = target_position - position
	var follow = smoothing * player.velocity.length()
	follow = min(follow, maxspeed)
	
	position += distance * follow * delta
