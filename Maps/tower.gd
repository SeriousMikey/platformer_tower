extends Node2D

@onready var camera: Camera2D = $Camera2D
@onready var player: CharacterBody2D = $Player
@onready var playtime_timer: Timer = $PlaytimeTimer

var playtime: int = 0


func _ready() -> void:
    Global.score_label.visible = true
    Global.time_label.visible = true
    playtime_timer.start(1)

func _process(_delta: float) -> void:
    camera.position.y = player.position.y
    if camera.position.y > 320:
        camera.position.y = 320

    Global.score_label.text = "Score: %dcm" % (-player.position.y + 479)

func _on_playtime_timer_timeout() -> void:
    playtime += 1
    Global.time_label.text = "Time: %d" % playtime
    playtime_timer.start(1)
