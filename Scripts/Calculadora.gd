extends Control

# Variables
onready var display:Label = $MarginContainer/VBoxContainer/Panel/Label;
# Constants
enum NUMBERS{zero,one,two,three,fourth,five,six,seven,eight,nine};
# Aritmetic Operators
var operators:Dictionary = {'add':'+','sub':'-','mul':'*','div':'/'};
# Here I gonna save the numbers and the operators to make 
var numbers:Array;
var alm_operators:Array;
# Where i gonna content the numbers
var num_1:float;
var num_2:float;


# Reset the text 'Probando' instead is empty
func _ready():
	display.text = "";

func _on_Equal_pressed():
	pass
	# mi idea almacenar los valores en un array y otro array los operadores
func _on_Erase_pressed():
	# reset all the text
	display.text = ""

func _on_Delete_pressed():
	# get the size of the label
	var get_size_display:int = len(display.text) - NUMBERS.one; 
	# this avoid that len comes less than 0 i.e. -1
	if get_size_display >= 0:
		display.text[get_size_display] = '';
# Aritmetic operators
func _math_operation(operation):
	match operation:
		"+":
			num_1 += num_2
#			print("Result: ",result_operation)
		"-":
			num_1 -= num_2
#			print("Result: ",result_operation)
		"/":
			num_1 /= num_2
#			print("Result: ",result_operation)
		"*":
			num_1 *= num_2
#			print("Result: ",result_operation)
# this function will get the size of the label
func _find_operator(text:String) -> int:
	var number:int = len(text);
	return number;
	
# return true if find an operator
func _found_operator(text:String, operator:String) -> bool:
	for element in text:
		if element == operator:
			return true;
	return false;
	
# Aritmetic functions
func _on_Add_pressed():
	var size_display: int = len(display.text);
	if display.text != '' and !_found_operator(display.text,operators.add):
		num_1 = display.text as float
		display.text += operators.add
		print("Showing the complete value: ",num_1, " and the text: ",display.text);
	elif _found_operator(display.text,operators.add):
		# aqui esta un error, verifica
		if display.text[size_display - 1] != operators.add:
			display.text += operators.add

func _on_Substraction_pressed():
	pass
#	operation = "subtract";
#	result.text = result.text + '-';

func _on_Divide_pressed():
	pass
#	operation = "divide";
#	result.text = result.text + '/';

func _on_Multiply_pressed():
	pass
#	operation = "multiply";
#	result.text = result.text + 'X';

# set of numbers
func _on_7_pressed():
	display.text += str(NUMBERS.seven);
#	if num_1 == null:
#		num_1 = numbers.seven
#	elif num_2 == null:
#		pass
#	result.text = result.text + str(numbers.seven);

func _on_8_pressed():
	display.text += str(NUMBERS.eight);

func _on_9_pressed():
	display.text += str(NUMBERS.nine);

func _on_4_pressed():
	display.text += str(NUMBERS.fourth);

func _on_5_pressed():
	display.text += str(NUMBERS.five);

func _on_6_pressed():
	display.text += str(NUMBERS.six);

func _on_1_pressed():
	display.text += str(NUMBERS.one);

func _on_2_pressed():
	display.text += str(NUMBERS.two);

func _on_3_pressed():
	display.text += str(NUMBERS.three);

func _on_0_pressed():
	display.text += str(NUMBERS.zero);

