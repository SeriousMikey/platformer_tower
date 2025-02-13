extends Control

@onready var tower: PackedScene = preload("res://Maps/tower.tscn")


func _on_new_game_button_pressed() -> void:
    # Changes scene to the level
    var new_game = tower.instantiate()
    Global.game.add_child(new_game)
    Global.in_game = true
    Global.ui.remove_child(self)

func _on_quit_button_pressed() -> void:
    # Quits the game
    get_tree().quit()
