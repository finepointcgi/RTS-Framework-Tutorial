extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewportSize = get_viewport().size
	var mousePos = get_viewport().get_mouse_position()
	
	if mousePos.x < 10:
		global_translation -= global_transform.basis.x
	elif mousePos.x > viewportSize.x - 10:
		global_translation += global_transform.basis.x
	if mousePos.y < 10:
		global_translation -= global_transform.basis.z
	elif mousePos.y > viewportSize.y - 10:
		global_translation += global_transform.basis.z
	if GameManager.CurrentState == GameManager.State.Play:
		if Input.is_action_just_released("MiddleMouseButton"):
			rotation_degrees += Vector3(0,90,0)
	
	if Input.is_action_just_released("MouseWheelUp"):
		if $Camera.global_translation.distance_to(global_translation) > 20:
			$Camera.global_translation -= $Camera.global_transform.basis.z * 2

	if Input.is_action_just_released("MouseWheelDown"):
		if $Camera.global_translation.distance_to(global_translation) < 50:
			$Camera.global_translation += $Camera.global_transform.basis.z * 2
		
	
	pass


