@tool extends EditorPlugin

const SCREEN_SAVER_NAME = "ScreenSaver"
const SCREEN_SAVER_BASE = "ColorRect"
const SCREEN_SAVER_SCRIPT = preload("screen_saver.gd")
const SCREEN_SAVER_ICON = preload("icon.png")

# ------------------------------------------------------------------------------
# Build-in methods
# ------------------------------------------------------------------------------

func _enter_tree() -> void:
	self.add_custom_type(SCREEN_SAVER_NAME, SCREEN_SAVER_BASE, SCREEN_SAVER_SCRIPT, SCREEN_SAVER_ICON)

func _exit_tree() -> void:
	self.remove_custom_type(SCREEN_SAVER_NAME)
