extends Node

enum State{
	Play,
	Buildling,
	Destroying
}

var CurrentState = State.Play

var Wood := 500
var Stone := 50
var Gold := 100
var Iron := 0
var Food := 1000

var Population : int = 0
var MaxPopulation : int = 4
var AlvPopulation : int = 0
var Citizen : PackedScene
var Happiness := 1
var spawnReady := true
var firePitSpaces : Array
var occupiedFirePitSpaces : Array
var foodBool = true
var TaxRate := 2
# Called when the node enters the scene tree for the first time.
func _ready():
	Citizen = ResourceLoader.load("res://Assets/Citizen.tscn")
	firePitSpaces = get_tree().get_nodes_in_group("CitizenSpawnPoint")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Population < MaxPopulation && spawnReady && Happiness > 0 && firePitSpaces.size() > 0:
		spawnReady = false
		yield(get_tree().create_timer(3.0), "timeout")
		spawnReady = true
		var citizen = Citizen.instance()
		firePitSpaces[0].add_child(citizen)
		citizen.FirePitPos = firePitSpaces[0]
		citizen.SpawnObjectSetup()
		occupiedFirePitSpaces.append(firePitSpaces.pop_front())
		Population += 1
		AlvPopulation += 1
	elif spawnReady && Happiness < 0:
		spawnReady = false
		yield(get_tree().create_timer(3.0), "timeout")
		spawnReady = true
		if AlvPopulation > 0:
			RemoveCitizen(1)
	if foodBool:
		foodBool = false
		yield(get_tree().create_timer(6.0), "timeout")
		Food -= Population
		if Food < 0:
			Food = 0
		foodBool = true
		Gold += round(Population * TaxRate)
		var happinessValue = 1
		if Food > 0:
			happinessValue += 1
		else:
			happinessValue -= 10
		
		if TaxRate > 0:
			happinessValue -= round(TaxRate / 2)
		if TaxRate < 0:
			happinessValue -= round(TaxRate / 2)
		
		Happiness += happinessValue
		if Happiness >= 2:
			Happiness = 2
		elif Happiness <= -2:
			Happiness = -2
	pass

func RemoveCitizen(Cost : int):
	for i in range(0, Cost, 1):
		firePitSpaces.append(occupiedFirePitSpaces[0])
		var temp : Spatial = occupiedFirePitSpaces[0]
		delete_children(temp)
		occupiedFirePitSpaces.remove(0)
		AlvPopulation -= 1
		Population -= 1

func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
