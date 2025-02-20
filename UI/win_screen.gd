extends Control

@onready var final_time_label: Label = $FinalTimeLabel


func _on_main_menu_button_pressed() -> void:
    # Go back to the title screen
    Global.back_to_title_screen()
    Global.toggle_esc_menu()

func change_time(final_time):
    final_time_label.text = "Final Time: %d" % final_time
