extends Node

var instructions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instructions = $Instructions
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Load the game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")



# Show the instructions panel
func _on_instructions_pressed() -> void:
	instructions.show()



# Hide the instructions panel
func _on_button_pressed() -> void:
	instructions.hide()
