extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$VBoxContainer/HBoxContainer/FoodValue.text = str(GameManager.Food)
	$VBoxContainer2/HBoxContainer/StoneValue.text = str(GameManager.Stone)
	$VBoxContainer2/HBoxContainer2/WoodValue.text = str(GameManager.Wood)
	$VBoxContainer/HBoxContainer2/IronValue.text = str(GameManager.Iron)
	pass
func buy(cost : int, amount : int, item) -> int:
	if GameManager.Gold >= cost:
		GameManager.Gold -= cost
		return item + amount
	return item

func sell(amount : int, money : int, item) -> int:
	if(item >= amount):
		GameManager.Gold += money
		return item - amount
	return item

func _on_SellFood_button_down():
	GameManager.Food = sell(5, 15, GameManager.Food)
	pass # Replace with function body.


func _on_SellIron_button_down():
	GameManager.Iron = sell(5, 30, GameManager.Iron)
	pass # Replace with function body.


func _on_BuyIron_button_down():
	GameManager.Iron = buy(40, 5, GameManager.Iron)
	pass # Replace with function body.


func _on_SellStone_button_down():
	GameManager.Stone = sell(5, 15, GameManager.Stone)
	pass # Replace with function body.


func _on_SellWood_button_down():
	GameManager.Wood = sell(5, 5, GameManager.Wood)
	pass # Replace with function body.


func _on_BuyWood_button_down():
	GameManager.Wood = buy(10, 5, GameManager.Wood)
	pass # Replace with function body.


func _on_BuyStone_button_down():
	GameManager.Stone = buy(20, 5, GameManager.Stone)
	pass # Replace with function body.


func _on_BuyFood_button_down():
	GameManager.Food = buy(25, 5, GameManager.Food)
	pass # Replace with function body.
