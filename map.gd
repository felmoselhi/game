extends Node2D
static var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_A):
		position.x += speed * delta
	elif Input.is_key_pressed(KEY_D):
		position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	var newTile = self.duplicate()
	newTile.position.x = position.x + 1408
	get_parent().add_child(newTile)
