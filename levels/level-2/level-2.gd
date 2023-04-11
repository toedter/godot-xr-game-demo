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
	for star in get_node("stars").get_children():
		star.connect("coin_collected", _on_coin_collected)
		coins_in_level += 1

func _on_coin_collected():
	collected_coins += 1
	
	if !$StarAudioStreamPlayer3D.playing:
		$StarAudioStreamPlayer3D.play()
	
	if collected_coins == coins_in_level:
		print("GAME WON!")
		teleport.active = true

func _on_water_player_hit_water():
	print("player hit water")
	origin_node.global_transform = start_origin
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
