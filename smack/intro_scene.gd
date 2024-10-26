extends Node2D

@onready var pathFollow = $Path2D/PathFollow2D
const SCROLL_SPEED = 0.5  # Adjust scroll speed as desired

func _ready():
	# Disable looping to prevent progress_ratio from wrapping
	pathFollow.loop = false

func _process(delta):
	# Continuously adjust progress_ratio if up or down keys are pressed
	if Input.is_action_pressed("ui_up"):
		pathFollow.progress_ratio -= SCROLL_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		pathFollow.progress_ratio += SCROLL_SPEED * delta

	# Clamp the progress_ratio to stay within [0, 1] bounds
	pathFollow.progress_ratio = clamp(pathFollow.progress_ratio, 0.0, 1.0)

	# Print the current progress ratio for debugging
	print(pathFollow.progress_ratio)
