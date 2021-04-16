extends Node

var combos = [
	{"e1": "Happy",
	"e2": "Angry",
	"result": "Vengeful"},
	{"e1": "Sad",
	"e2": "Surprised",
	"result": "Disappointed"},
	
]
	
var selectedEmotion = ""
var emotionButton = preload("Emotion.tscn")
func on_button_pressed(who):		
	if selectedEmotion == "":
		selectedEmotion = who
	else:
		if selectedEmotion == who:
			selectedEmotion == ""
		else:		
			var combo = searchCombos(selectedEmotion, who)
			if (combo):
				print(combo.result)	
				var newEmotion = emotionButton.instance()
				newEmotion.emotionName = combo.result
				add_child(newEmotion)
				get_node(selectedEmotion).pressed = false
				selectedEmotion = ""				
				get_node(who).pressed = false	
				get_parent().setLabel("new emotion: " + combo.result)
			else:
				print("no combo!")	
				get_node(selectedEmotion).pressed = false
				selectedEmotion = ""				
				get_node(who).pressed = false
				get_parent().setLabel("nope!")
				

func searchCombos(e1, e2):
	for combo in combos:
		if e1 == combo.e1  || e1 == combo.e2:
			if e2 == combo.e1 || e2 == combo.e2:
				return combo
		else: 
			continue
		return (false)
