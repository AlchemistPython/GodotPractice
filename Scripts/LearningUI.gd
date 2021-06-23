extends Control

onready var counter_1:int  = 0;
onready var counter_2:int  = 0;
onready var counter_3:int  = 0;

onready var count_1 = $MarginContainer/VBoxContainer/ContainerCounter/Counter_1
onready var count_2 = $MarginContainer/VBoxContainer/ContainerCounter/Counter_2
onready var count_3 = $MarginContainer/VBoxContainer/ContainerCounter/Counter_3

func _on_inc_count_1_pressed():
	counter_1 = _increment(counter_1);
	count_1.text = str(counter_1)

func _on_dec_count_1_pressed():
	counter_1 = _decrement(counter_1);
	count_1.text = str(counter_1)

func _on_inc_count_2_pressed():
	counter_2 = _increment(counter_2);
	count_2.text = str(counter_2)

func _on_dec_count_2_pressed():
	counter_2 = _decrement(counter_2);
	count_2.text = str(counter_2)

func _on_inc_count_3_pressed():
	counter_3 = _increment(counter_3);
	count_3.text = str(counter_3)

func _on_dec_count_3_pressed():
	counter_3 = _decrement(counter_3);
	count_3.text = str(counter_3)

func _increment(value:int):
	value += 1
	return value
func _decrement(value:int):
	value -= 1
	return value
