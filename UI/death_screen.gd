extends Control

@onready var final_score_label: Label = $FinalScoreLabel


func _on_main_menu_button_pressed() -> void:
    # Go back to the title screen
    Global.back_to_title_screen()
    Global.toggle_esc_menu()

func change_score(final_score):
    final_score_label.text = "Final Score: %d" % final_score
