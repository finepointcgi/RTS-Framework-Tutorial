extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/VBoxContainer/Wood/WoodValue.text = str(GameManager.Wood)
	$Control/VBoxContainer/Stone/StoneValue.text = str(GameManager.Stone)
	$Control/VBoxContainer/Iron/IronValue.text = str(GameManager.Iron)
	$Control/VBoxContainer/Food/FoodValue.text = str(GameManager.Food)
	$Control/VBoxContainer/Gold/GoldValue.text = str(GameManager.Gold)
	$Control/VBoxContainer2/Pop/PopValue.text = str(GameManager.AlvPopulation) + " / " + str(GameManager.MaxPopulation)
	$Control/VBoxContainer2/Hap/HapValue.text = str(GameManager.Happiness)
	$TabContainer/Economy/Control/TaxRate.text = str(GameManager.TaxRate) + " %"
	pass


func _on_BuildWoodCutterButton_button_down():
	BuildManager.SpawnWoodcutter()
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	BuildManager.AbleToBuild = false
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	BuildManager.AbleToBuild = true
	pass # Replace with function body.


func _on_BuildStockpile_button_down():
	BuildManager.SpawnStockpile()
	pass # Replace with function body.


func _on_BuildStoneCutterButton2_button_down():
	BuildManager.SpawnStonecutter()
	pass # Replace with function body.


func _on_BuildIronWorker_button_down():
	BuildManager.SpawnIronWorker()
	pass # Replace with function body.


func _on_Granery_button_down():
	BuildManager.SpawnGranery()
	pass # Replace with function body.


func _on_Orchard_button_down():
	BuildManager.SpawnOrchard()
	pass # Replace with function body.


func _on_BuildHouse_button_down():
	BuildManager.SpawnHouse()
	pass # Replace with function body.


func _on_BuildWallNarrow_button_down():
	BuildManager.SpawnWallNarrow()
	pass # Replace with function body.


func _on_DestroyMode_button_down():
	GameManager.CurrentState = GameManager.State.Destroying
	pass # Replace with function body.


func _on_IncreaseTaxes_button_down():
	GameManager.TaxRate += 2
	pass # Replace with function body.


func _on_DecreaseTaxes_button_down():
	GameManager.TaxRate -= 2 
	pass # Replace with function body.
