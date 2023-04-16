@tool
extends DemoSceneBase

@onready var origin_node : XROrigin3D = XRHelpers.get_xr_origin(self)
@onready var start_origin := origin_node.global_transform

@onready var teleport := $Teleport
@onready var collected_coins := 0
@onready var coins_in_level := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	teleport.active = false;
	
	for child in get_all_children(get_tree().current_scene):
		if child.get_script():
			print(child.get_script().get_path())
			if child.get_script().get_path().ends_with("star.gd"):
				child.connect("coin_collected", _on_coin_collected)
				coins_in_level += 1

func _on_coin_collected():
	collected_coins += 1
	
	$StarAudioStreamPlayer3D.play()
	
	if collected_coins == coins_in_level:
		teleport.active = true

func _on_water_player_hit_water():
	origin_node.global_transform = start_origin
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()


func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr
