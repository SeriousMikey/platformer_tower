extends Node2D

@onready var camera: Camera2D = $Camera2D
@onready var player: CharacterBody2D = Global.get_player()


func _ready() -> void:
    Global.score_label.visible = true

func _process(_delta: float) -> void:
    camera.position.y = player.position.y
    if camera.position.y > 320:
        camera.position.y = 320

    Global.score_label.text = "Score: %dcm" % (-player.position.y + 471)
