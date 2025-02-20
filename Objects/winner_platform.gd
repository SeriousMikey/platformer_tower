extends Area2D


func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("Player"):
        body.get_node("Music").stop()
        $AudioStreamPlayer2D.play()
        Global.show_win_screen(Global.game.get_child(0).playtime)
