extends Node
class_name Bug

var has_abdomen: bool = false
var has_antennae: bool = false
var has_head: bool = false
var has_legs: bool = false
var has_thorax: bool = false
var has_wings: bool = false

func add_part( part: String ) -> bool:
	match( part ):
		"ABDOMEN":
			return _add_abdomen()
		"ANTENNAE":
			return _add_antennae()
		"HEAD":
			return _add_head()
		"LEGS":
			return _add_legs()
		"THORAX":
			return _add_thorax()
		"WINGS":
			return _add_wings()
		_:
			return false


func _add_abdomen() -> bool:
	has_abdomen = true
	return true


func _add_antennae() -> bool:
	if( !has_head ):
		return false
	
	has_antennae = true
	return true


func _add_head() -> bool:
	if( !has_thorax ):
		return false
	
	has_head = true
	return true


func _add_legs() -> bool:
	if( !has_thorax ):
		return false
	
	has_legs = true
	return true


func _add_thorax() -> bool:
	has_thorax = true
	return true


func _add_wings() -> bool:
	if( !has_thorax ):
		return false
	
	has_wings = true
	return true
