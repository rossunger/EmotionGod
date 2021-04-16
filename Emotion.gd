tool
extends Button

export var emotionName = "emotion" setget setText

signal emotion_pressed

func _ready():
	connect("pressed", get_parent(), "on_button_pressed", [name])

func setText(value):
	text = value
	emotionName=value
	name = value
