extends Button


export var URL = "https://www.tribalgames.org/dashboard"


func _on_MarketplaceButton_button_down():
	OS.shell_open(URL)
	pass # Replace with function body.
