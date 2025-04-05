extends Node

@export var UIManager: GameUIManager
@export var GameUI: Node
@export var roll_button: Node
@export var game_over_ui: Node
@export var winner_label: Node

var response_prefab = preload("res://Prefabs/GameResponse/game_response.tscn")
var player_prefab = preload("res://Prefabs/PlayArea/play_area.tscn")

var player: Player
var opponent: Player
var current_player: Player = null

var opponent_names: Array[String]

var dice: Dice = Dice.new()
var tree: SceneTree

func _ready() -> void:
	tree = get_tree()
	
	dice.set_number_of_sides( 6 )
	
	opponent_names = [
		"Steve",
		"Beth",
		"Thomas",
		"Jane",
		"Frederick",
		"Zoe"
	]
	
	_start_game()



func _start_game() -> void:
	game_over_ui.hide()
		
	player = player_prefab.instantiate()
	player.set_player( "" )
	GameUI.add_child( player )
	
	opponent = player_prefab.instantiate()
	opponent.set_player( opponent_names[ dice.roll_dice() - 1 ] )
	GameUI.add_child( opponent )
	
	_change_players()




func handle_dice_roll() -> void:
	roll_button.disabled = true
	
	var roll = dice.roll_dice()
	_generate_response( "Rolled a %d" % roll )
	await get_tree().create_timer( 0.5 ).timeout
	
	var result = current_player.handle_roll( roll )
	_generate_response( Globals.response_messages[ result ] )
	await get_tree().create_timer( 0.5 ).timeout
	
	if current_player.is_bug_completed():
		var text = "[rainbow]%s![/rainbow]" % current_player.player_name
		winner_label.set_text( text )
		
		game_over_ui.show()
		player.queue_free()
		opponent.queue_free()
		UIManager.clear_messages()
	else:
		_change_players()



func _generate_response( text: String ) -> void:
	var response = response_prefab.instantiate()
	
	response.set_text( text );
	UIManager.update_ui( response )



func _change_players() -> void:
	var text
	if current_player == opponent or current_player == null:
		current_player = player
		text = "It's now your turn! \nRoll the dice"
		roll_button.disabled = false
	else:
		current_player = opponent
		text = "It's now %s's turn! \nRolling..." % opponent.player_name
	
	var response = response_prefab.instantiate()
	
	response.set_text( text );
	UIManager.update_ui( response )
	
	if current_player == opponent:
		await get_tree().create_timer( 0.5 ).timeout
		handle_dice_roll()




func _on_quit_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	tree.quit()
