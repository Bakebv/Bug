extends Node

var rolls = [
	"ABDOMEN",
	"ANTENNAE",
	"HEAD",
	"LEGS",
	"THORAX",
	"WINGS"
]

var response_codes = {
	"HAS_ABDOMEN": 1,
	"HAS_ANTENNAE": 2,
	"HAS_HEAD": 3,
	"HAS_LEGS": 4,
	"HAS_THORAX": 5,
	"HAS_WINGS": 6,
	"ADDED_ABDOMEN": 11,
	"ADDED_ANTENNAE": 12,
	"ADDED_HEAD": 13,
	"ADDED_LEGS": 14,
	"ADDED_THORAX": 15,
	"ADDED_WINGS": 16,
	"CANNOT_ADD_ABDOMEN": 21,
	"CANNOT_ADD_ANTENNAE": 22,
	"CANNOT_ADD_HEAD": 23,
	"CANNOT_ADD_LEGS": 24,
	"CANNOT_ADD_THORAX": 25,
	"CANNOT_ADD_WINGS": 26,
}

var response_messages = {
	1: "[shake rate=10 level=4][color=dodger_blue]The bug already has an abdomen![/color][/shake]",
	2: "[shake rate=10 level=4][color=dodger_blue]The bug already has antennae![/color][/shake]",
	3: "[shake rate=10 level=4][color=dodger_blue]he bug already has a head![/color][/shake]",
	4: "[shake rate=10 level=4][color=dodger_blue]The bug already has legs![/color][/shake]",
	5: "[shake rate=10 level=4][color=dodger_blue]The bug already has a thorax![/color][/shake]",
	6: "[shake rate=10 level=4][color=dodger_blue]The bug already has wings![/color][/shake]",
	11: "[wave amp=10 freq=5][color=forest_green]Added an abdomen to the bug![/color][/wave]",
	12: "[wave amp=10 freq=5][color=forest_green]Added antennae to the bug![/color][/wave]",
	13: "[wave amp=10 freq=5][color=forest_green]Added a head to the bug![/color][/wave]",
	14: "[wave amp=10 freq=5][color=forest_green]Added legs to the bug![/color][/wave]",
	15: "[wave amp=10 freq=5][color=forest_green]Added a thorax to the bug![/color][/wave]",
	16: "[wave amp=10 freq=5][color=forest_green]Added wings to the bug![/color][/wave]",
	21: "[shake rate=10 level=4][color=orange_red]Couldn't add an abdomen to the bug![/color][/shake]",
	22: "[shake rate=10 level=4][color=orange_red]Couldn't add antennae to the bug![/color][/shake]",
	23: "[shake rate=10 level=4][color=orange_red]Couldn't add a head to the bug![/color][/shake]",
	24: "[shake rate=10 level=4][color=orange_red]Couldn't add legs to the bug![/color][/shake]",
	25: "[shake rate=10 level=4][color=orange_red]Couldn't add a thorax to the bug![/color][/shake]",
	26: "[shake rate=10 level=4][color=orange_red]Couldn't add wings to the bug![/color][/shake]"
}

var computer_quips = {
	
}
