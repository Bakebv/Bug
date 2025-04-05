extends VBoxContainer

@export var response_text: RichTextLabel


func set_text( text: String,) -> void:
	response_text.text = text
