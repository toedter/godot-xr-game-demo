extends Area3D

## Signal emitted when the coin is collected
signal player_hit_water()

func _on_body_entered(body):
	if body.name == "PlayerBody":
		emit_signal("player_hit_water")
