extends Node
class_name GameUIManager

var max_responses: int = 30
var current_scroll: int = 0
var response_ui: Node
var scroller: ScrollContainer
var scrollbar: ScrollBar

func _ready() -> void:
	response_ui = $ScrollContainer/MessageDisplay
	scroller = $ScrollContainer
	
	scrollbar = scroller.get_v_scroll_bar()
	scrollbar.connect( "changed", _scroll_to_bottom )



func update_ui( prefab: Node ) -> void:
	response_ui.add_child( prefab )
	if response_ui.get_child_count() > max_responses:
		var oldest_respone = response_ui.get_child( 1 )
		oldest_respone.queue_free()



func _scroll_to_bottom() -> void:
	if( scrollbar.max_value != current_scroll ):
		current_scroll = scrollbar.max_value
		scroller.scroll_vertical = scrollbar.max_value



func clear_messages() -> void:
	var messages = response_ui.get_children()
	for message in messages:
		message.queue_free()
