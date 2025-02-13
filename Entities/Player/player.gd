extends CharacterBody2D

# Export Variables
@export var speed = 300.0
@export var normal_jump_velocity = -500.0
@export var super_jump_velocity = -2000.0

# Variables
var jump_velocity: float
var dead: bool = false


func _ready() -> void:
    jump_velocity = normal_jump_velocity

func _physics_process(delta: float) -> void:
    # If the player is not in the menu
    if !Global.in_menu and !dead:
        # Gravity
        if not is_on_floor():
            velocity += get_gravity() * delta

        # Jump
        if Input.is_action_just_pressed("jump") and is_on_floor():
            velocity.y = jump_velocity

        # Get input direction
        var direction := Input.get_axis("left", "right")
        if direction:
            # Move in the desired direction
            velocity.x = direction * speed
        else:
            # Don't move
            velocity.x = move_toward(velocity.x, 0, speed)

        # Built-in movement function
        move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
    # If hit by an enemy
    if area.is_in_group("Enemy"):
        dead = true
        Global.show_death_screen(-position.y + 471)
        get_parent().call_deferred("remove_child", self)
        
    # If area is a super jump platform
    elif area.is_in_group("SuperJumpPlatform"):
        jump_velocity = super_jump_velocity

func _on_hitbox_area_exited(area: Area2D) -> void:
    # If area is a super jump platform
    if area.is_in_group("SuperJumpPlatform"):
        jump_velocity = normal_jump_velocity
