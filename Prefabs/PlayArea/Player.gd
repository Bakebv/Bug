extends Node
class_name Player

@export var bug_label: Node

var player_name: String
var bug: Bug

func set_player( name: String ) -> void:
	bug = $Bug
	var player_label
	
	if( name == "" ):
		player_name = "You"
		player_label = "Your"
	else:
		player_name = name
		player_label = "%s's" % name
	
	var player_bug_label = "%s Bug" % player_label
	
	bug_label.text = player_bug_label



func handle_roll( value: int ) -> int:
	match( Globals.rolls [ value - 1 ] ): # -1 to convert a 1-6 die roll to 0 based array notation
		"ABDOMEN":
			if( bug.has_abdomen ):
				return Globals.response_codes.HAS_ABDOMEN
			
			if( bug.add_part( "ABDOMEN" ) ):
				return Globals.response_codes.ADDED_ABDOMEN
			return Globals.response_codes.CANNOT_ADD_ABDOMEN
		"ANTENNAE":
			if( bug.has_antennae ):
				return Globals.response_codes.HAS_ANTENNAE
			
			if( bug.add_part( "ANTENNAE" ) ):
				return Globals.response_codes.ADDED_ANTENNAE
			return Globals.response_codes.CANNOT_ADD_ANTENNAE
		"HEAD":
			if( bug.has_head ):
				return Globals.response_codes.HAS_HEAD
			
			if( bug.add_part( "HEAD" ) ):
				return Globals.response_codes.ADDED_HEAD
			return Globals.response_codes.CANNOT_ADD_HEAD
		"LEGS":
			if( bug.has_legs ):
				return Globals.response_codes.HAS_LEGS
			
			if( bug.add_part( "LEGS" ) ):
				return Globals.response_codes.ADDED_LEGS
			return Globals.response_codes.CANNOT_ADD_LEGS
		"THORAX":
			if( bug.has_thorax ):
				return Globals.response_codes.HAS_THORAX
			
			if( bug.add_part( "THORAX" ) ):
				return Globals.response_codes.ADDED_THORAX
			return Globals.response_codes.CANNOT_ADD_THORAX
		"WINGS":
			if( bug.has_wings ):
				return Globals.response_codes.HAS_WINGS
			
			if( bug.add_part( "WINGS" ) ):
				return Globals.response_codes.ADDED_WINGS
			return Globals.response_codes.CANNOT_ADD_WINGS
		_:
			print( "Unhandled" )
			return 0



func is_bug_completed() -> bool:
	return bug.has_abdomen && bug.has_antennae && bug.has_head && bug.has_legs && bug.has_thorax && bug.has_wings
