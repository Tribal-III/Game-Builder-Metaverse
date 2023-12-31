extends Node2D

# retrieve necessary nodes
onready var createPasswordInput = get_parent().get_node("RegisterScreen").get_node("RegisterBackground").get_node(
	"PasswordInput"
)

# set up new regex for password input
var regexLowerCase = RegEx.new()
var regexUpperCase = RegEx.new()
var regexNumbers = RegEx.new()
var criteriaMet


# Called when the node enters the scene tree for the first time.
#set up regex to correct password input
func _ready():
	visible = false
	regexLowerCase.compile("[a-z]+")
	regexUpperCase.compile("[A-Z]+")
	regexNumbers.compile("[0-9]+")
	criteriaMet = false


func _process(delta):
	#if input is clicked on, display password criteria
	if createPasswordInput.has_focus() == true:
		visible = true
	else:
		visible = false

	#check password criteria
	# if certain criteria is met, change the color of the check box
	if createPasswordInput.text.length() >= 8:
		get_node("PasswordCriteriaBox").get_node("CharLengthChk").modulate = Color(1, 1, 1)
	else:
		get_node("PasswordCriteriaBox").get_node("CharLengthChk").modulate = Color(0, 0, 0)

	if regexLowerCase.search(createPasswordInput.text):
		get_node("PasswordCriteriaBox").get_node("LowerCaseChk").modulate = Color(1, 1, 1)
	else:
		get_node("PasswordCriteriaBox").get_node("LowerCaseChk").modulate = Color(0, 0, 0)

	if regexUpperCase.search(createPasswordInput.text):
		get_node("PasswordCriteriaBox").get_node("UpperCaseChk").modulate = Color(1, 1, 1)
	else:
		get_node("PasswordCriteriaBox").get_node("UpperCaseChk").modulate = Color(0, 0, 0)

	if regexNumbers.search(createPasswordInput.text):
		get_node("PasswordCriteriaBox").get_node("NumberChk").modulate = Color(1, 1, 1)
	else:
		get_node("PasswordCriteriaBox").get_node("NumberChk").modulate = Color(0, 0, 0)
#
	if (
		createPasswordInput.text.length() >= 8
		and regexLowerCase.search(createPasswordInput.text)
		and regexUpperCase.search(createPasswordInput.text)
		and regexNumbers.search(createPasswordInput.text)
	):
		criteriaMet = true
	else:
		criteriaMet = false
