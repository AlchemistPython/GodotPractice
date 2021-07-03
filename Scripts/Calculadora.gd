extends Control

# Variables
var temp:float;
onready var display:Label = $MarginContainer/VBoxContainer/Panel/Label;
# Constants
enum NUMBERS{zero,one,two,three,fourth,five,six,seven,eight,nine};
# Aritmetic Operators
var operators:Dictionary = {
	'mul':'*',
	'div':'/',
	'add':'+',
	'sub':'-',
};
# Array where save operators and the complete string 
var sort_operators:Array;
var aritmetic_operation:Array;
# Where i gonna content the numbers
var num_1:float;
var num_2:float;

# Reset the text 'Probando' instead is empty
func _ready():
	display.text = "";

func _on_Equal_pressed():
	save_it();
	_operation();

func save_it() -> void:
	# local variables temp number and lenght of the label
	var temp:String;
	var lenght:int = len(display.text);
	# loop through the label
	for element in range(lenght):
		# check if are equal to numbers
		if display.text[element] in NUMBERS.values() as String:
			# concatenated the numbers in one block
			temp += display.text[element];
			# if the lenght of the label it's out of the index
			if element+1 == lenght:
				# save it in the array
				aritmetic_operation.append(temp as float)
		# if exist an operator after a number
		elif display.text[element] in operators.values():
			# save first the number
			aritmetic_operation.append(temp as float)
			temp = ''# reset the number
			# save the operator
			aritmetic_operation.append(display.text[element])
#	print("Array: ",aritmetic_operation);

func _operation() -> float:
	# Variables
	var counter: int = 0;
	var result: float;
	var num_1:float;
	var num_2:float;
	# another issue, is if the value */ it's the final the number its the last save
	while counter < aritmetic_operation.size():
		num_1 = 0 if aritmetic_operation[counter - 1] in operators.values() else aritmetic_operation[counter - 1]
		num_2 = 0 if aritmetic_operation[counter + 1] in operators.values() else aritmetic_operation[counter + 1]
		if '*' in aritmetic_operation or '/' in aritmetic_operation:
			if aritmetic_operation[counter] == '*':
				result = num_1 * num_2
				# remove the element
				# replace the element for result
				# reset the counter
				aritmetic_operation.remove(counter - 1);
				aritmetic_operation.remove(counter);
				aritmetic_operation.remove(counter + 1);
				aritmetic_operation.insert(counter - 1, result);
			elif aritmetic_operation[counter] == '/':
				result = num_1 / num_2
				# remove the element
				# replace the element for result
				# reset the counter
				# change for a function for reduce the code
				aritmetic_operation.remove(counter - 1);
				aritmetic_operation.remove(counter);
				aritmetic_operation.remove(counter + 1);
				aritmetic_operation.insert(counter - 1, result);
			counter += 1;
		else:
			if aritmetic_operation[counter] == '+':
				result = num_1 + num_2
			elif aritmetic_operation[counter] == '-':
				result = num_1 - num_2
	return result;

func _on_Erase_pressed():
	# reset all the text
	display.text = ""
	# reset the arrays
	aritmetic_operation.clear()

func _on_Delete_pressed():
	# get the size of the label
	var get_size_display:int = len(display.text) - NUMBERS.one; 
	# this avoid that len comes less than 0 i.e. -1
	if get_size_display >= 0:
		display.text[get_size_display] = '';

# Aritmetic operators
func _math_operation(operation:String, num_1:float,num_2:float) ->float:
	var operation_result:float;
	match operation:
		"+":
			operation_result = num_1 + num_2
		"-":
			operation_result = num_1 - num_2
		"/":
			operation_result = num_1 / num_2
		"*":
			operation_result = num_1 * num_2
	return operation_result

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
		display.text += operators.add
	elif _found_operator(display.text,operators.add):
		if display.text[size_display - 1] != operators.add:
			display.text += operators.add

func _on_Substraction_pressed():
	var size_display: int = len(display.text);
	if display.text != '' and !_found_operator(display.text,operators.sub):
		display.text += operators.sub
	elif _found_operator(display.text,operators.sub):
		if display.text[size_display - 1] != operators.sub:
			display.text += operators.sub

func _on_Divide_pressed():
	var size_display: int = len(display.text);
	if display.text != '' and !_found_operator(display.text,operators.div):
		display.text += operators.div
	elif _found_operator(display.text,operators.div):
		if display.text[size_display - 1] != operators.div:
			display.text += operators.div

func _on_Multiply_pressed():
	var size_display: int = len(display.text);
	if display.text != '' and !_found_operator(display.text,operators.mul):
		display.text += operators.mul
	elif _found_operator(display.text,operators.mul):
		if display.text[size_display - 1] != operators.mul:
			display.text += operators.mul

# set of numbers
func _on_7_pressed():
	display.text += str(NUMBERS.seven);

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
