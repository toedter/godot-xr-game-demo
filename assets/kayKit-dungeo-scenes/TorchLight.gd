extends OmniLight3D

@onready var noise = FastNoiseLite.new()
@onready var position_x_ori = position.x
@onready var position_y_ori = position.y
@onready var position_z_ori = position.z

var value = 0.0
var direction = 1

func _ready():
	randomize()
	value = randf()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light_energy = value
		
	value += (randf() / 30 * direction);
	if value > 1.0:
		direction = -1;
	if value < 0.9:
		direction = 1;
	
