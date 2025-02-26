@tool class_name ScreenSaverLogo extends CharacterBody2D

@export var initial_position: Vector2 = Vector2(720, 540):
	set(new_value):
		initial_position = new_value
		_update()
@export var initial_velocity: Vector2 = Vector2(200, 200):
	set(new_value):
		initial_velocity = new_value
		_update()
@export var run_in_editor: bool = false:
	set(new_value):
		run_in_editor = new_value
		_update()

var _velocity: Vector2 = initial_velocity

func _ready() -> void:
	_update()

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint() and not run_in_editor: return
	var collision_info = move_and_collide(delta * _velocity)
	if collision_info:
		_velocity = _velocity.bounce(collision_info.get_normal())

func _update_initial_position() -> void:
	if self == null: return
	
	self.position = initial_position

func _update_initial_velocity() -> void:
	if self == null: return
	
	_velocity = initial_velocity

func _update() -> void:
	_update_initial_position()
	_update_initial_velocity()
