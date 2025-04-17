@tool class_name ScreenSaver extends ColorRect

const SCREEN_SAVER_BORDER_SCENE = preload("screen_saver_border/screen_saver_border.tscn")
const SCREEN_SAVER_LOGO_SCENE = preload("screen_saver_logo/screen_saver_logo.tscn")

@export var logo: Texture = null:
	set(new_value):
		logo = new_value
		_ui_update()
@export var background_color: Color = Color.BLACK:
	set(new_value):
		background_color = new_value
		_ui_update()
@export var run_in_editor: bool = false:
	set(new_value):
		run_in_editor = new_value
		_ui_update()

var _border: ScreenSaverBorder = null
var _logo: ScreenSaverLogo = null

func _ready() -> void:
	_border = SCREEN_SAVER_BORDER_SCENE.instantiate()
	self.add_child(_border)
	
	_logo = SCREEN_SAVER_LOGO_SCENE.instantiate()
	self.add_child(_logo)
	
	self.gui_input.connect(_on_gui_input)
	
	_ui_update()

func _on_gui_input(_event: InputEvent) -> void:
	if self.visible: self.visible = false

func _ui_update_init() -> void:
	if self == null: return
	if _border == null: return
	if _logo == null: return
	
	self.mouse_filter = Control.MOUSE_FILTER_STOP
	_border.border_size = self.size

func _ui_update_logo() -> void:
	if _logo == null: return
	
	_logo.texture = logo

func _ui_update_background_color() -> void:
	if self == null: return
	
	self.color = background_color

func _ui_update_run_in_editor() -> void:
	if _border == null: return
	if _logo == null: return
	
	_logo.run_in_editor = run_in_editor

func _ui_update() -> void:
	_ui_update_init()
	_ui_update_logo()
	_ui_update_background_color()
	_ui_update_run_in_editor()
