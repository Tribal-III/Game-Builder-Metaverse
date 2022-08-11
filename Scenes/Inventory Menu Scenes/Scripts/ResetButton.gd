extends Button


onready var itemTypeDropDown = get_node('/root/InventoryMenu/InventoryBackground/InventoryList/InventoryListSearchBar/ItemTypeDropDown/')
onready var itemColorDropDown = get_node('/root/InventoryMenu/InventoryBackground/InventoryList/InventoryListSearchBar/ItemColorDropDown/')
onready var itemSizeDropDown = get_node('/root/InventoryMenu/InventoryBackground/InventoryList/InventoryListSearchBar/ItemSizeDropDown/')
onready var orderByDropDown = get_node('/root/InventoryMenu/InventoryBackground/InventoryList/InventoryListSearchBar/ItemSortDropDown/')
onready var itemDescPanel = get_node('/root/InventoryMenu/InventoryBackground/ItemDescription/')
onready var itemSearchBar = get_node('/root/InventoryMenu/InventoryBackground/InventoryList/InventoryListSearchBar/ItemSearchBar')
onready var inventoryList = get_node('/root/InventoryMenu/InventoryBackground/InventoryList/ScrollContainer/GridContainer')
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func resetList():
	for items in inventoryList.get_children():
		items.visible = true

func _on_ResetButton_pressed():
	itemTypeDropDown.select(0)
	itemColorDropDown.select(0)
	itemSizeDropDown.select(0)
	orderByDropDown.select(0)
	itemSearchBar.text = ''
	itemDescPanel.visible = false
	resetList()
