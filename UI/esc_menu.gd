extends Control


func _on_resume_button_pressed() -> void:
    # Toggle the menu
    Global.toggle_esc_menu()

func _on_main_menu_button_pressed() -> void:
    # Go back to the title screen
    Global.back_to_title_screen()
