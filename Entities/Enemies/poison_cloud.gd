extends Area2D

@export var speed: float = 300
@export var max_left: float = 120
@export var max_right: float = 1000

var moving_left: bool = false
var moving_right: bool = false


func _ready() -> void:
    if randi_range(0, 1) == 0:
        moving_left = true
    else:
        moving_right = true

func _physics_process(delta: float) -> void:
    if !Global.in_menu:
        if moving_left:
            move_left(delta)
        elif moving_right:
            move_right(delta)
    
func move_left(delta) -> void:
    position.x -= delta * speed
    if position.x <= max_left:
        moving_left = false
        moving_right = true

func move_right(delta) -> void:
    position.x += delta * speed
    if position.x >= max_right:
        moving_right = false
        moving_left = true
