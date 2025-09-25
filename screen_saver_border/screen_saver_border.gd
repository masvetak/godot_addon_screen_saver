@tool class_name ScreenSaverBorder extends StaticBody2D

@export var border_size: Vector2 = Vector2(1920, 1080):
	set(new_value):
		border_size = new_value
		_ui_update()
@export var border_tickness: int = 4:
	set(new_value):
		border_tickness = new_value
		_ui_update()

@onready var _collision_shape_top: CollisionShape2D = %CollisionShapeTop
@onready var _collision_shape_right: CollisionShape2D = %CollisionShapeRight
@onready var _collision_shape_bottom: CollisionShape2D = %CollisionShapeBottom
@onready var _collision_shape_left: CollisionShape2D = %CollisionShapeLeft

func _ready() -> void:
	_ui_update()

func _ui_update_collision_shape() -> void:
	if _collision_shape_top == null: return
	if _collision_shape_right == null: return
	if _collision_shape_bottom == null: return
	if _collision_shape_left == null: return
	
	_collision_shape_top.position.x = border_size.x / 2
	_collision_shape_top.position.y = -border_tickness
	_collision_shape_top.shape.extents.x = border_size.x / 2 + border_tickness * 2
	_collision_shape_top.shape.extents.y = border_tickness

	_collision_shape_right.position.x = border_size.x + border_tickness
	_collision_shape_right.position.y = border_size.y / 2
	_collision_shape_right.shape.extents.x = border_tickness
	_collision_shape_right.shape.extents.y = border_size.y / 2 + border_tickness * 2

	_collision_shape_bottom.position.x = border_size.x / 2
	_collision_shape_bottom.position.y = border_size.y + border_tickness
	_collision_shape_bottom.shape.extents.x = border_size.x / 2 + border_tickness * 2
	_collision_shape_bottom.shape.extents.y = border_tickness
	
	_collision_shape_left.position.x = -border_tickness
	_collision_shape_left.position.y = border_size.y / 2
	_collision_shape_left.shape.extents.x = border_tickness
	_collision_shape_left.shape.extents.y = border_size.y / 2 + border_tickness * 2

func _ui_update() -> void:
	_ui_update_collision_shape()
