extends Area3D

## Signal emitted when the coin is collected
signal coin_collected()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(delta * 100))

func _on_body_entered(body):
	if body.name == "PlayerBody":
		emit_signal("coin_collected")
		queue_free()

