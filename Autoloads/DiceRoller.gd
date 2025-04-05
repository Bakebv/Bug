extends Node
class_name Dice

var sides: int

func set_number_of_sides( num_sides: int ) -> void:
	sides = num_sides



func roll_dice( dice_count: int = 1 ) -> int:
	var total = 0
	
	for n in dice_count:
		total += randi_range( 1, sides )
	
	return total
