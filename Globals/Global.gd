extends Node

# Top Level Stuff
@onready var main: Node2D = get_parent().get_node("Main")
@onready var game: Node2D = main.get_node("Game")
@onready var ui: CanvasLayer = main.get_node("UI")

# Second Level Stuff
@onready var esc_menu: Control = ui.get_node("EscMenu")
@onready var title_screen: Control = preload("res://UI/title_screen.tscn").instantiate()
@onready var score_label: Label = ui.get_node("ScoreLabel")
@onready var death_screen: Control = preload("res://UI/death_screen.tscn").instantiate()

# Third Level Stuff
var in_game: bool = false
var in_menu: bool = false


func _process(_delta: float) -> void:
    # Show menu if pressed
    if Input.is_action_just_pressed("exit") and in_game:
        toggle_esc_menu()

func toggle_esc_menu() -> void:
    # Toggle the menu
    esc_menu.visible = !esc_menu.visible
    in_menu = esc_menu.visible

func back_to_title_screen() -> void:
    # Toggle the menu
    toggle_esc_menu()
    
    # Remove the game screen if there is one
    if game.get_child_count() > 0:
        game.remove_child(game.get_child(0))
    
    # Remove death screen if there is one
    if ui.get_node_or_null("DeathScreen"):
        ui.remove_child(ui.get_node("DeathScreen"))
    
    # Change to not in game
    in_game = false
    
    # Add the title screen
    ui.add_child(title_screen)

func get_player() -> CharacterBody2D:
    return game.get_child(0).get_node("Player")

func show_death_screen(final_score):
    ui.add_child(death_screen)
    death_screen.change_score(final_score)
