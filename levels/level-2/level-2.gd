@tool
extends DemoSceneBase

@onready var origin_node : XROrigin3D = XRHelpers.get_xr_origin(self)
@onready var start_origin := origin_node.global_transform

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	var current_origin := origin_node.global_transform


func _on_fall_damage_player_fall_damage(damage):
	origin_node.global_transform = start_origin
