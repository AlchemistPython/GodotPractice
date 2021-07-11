extends Control

# =============================== Variables ==================================
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
var chain:Array;
# ============================== Methods ======================================
# Reset the text 'Probando' instead is empty
func _ready():
	display.text = "";

func _on_Equal_pressed():
	save_it();
	_reading_the_chain();
	display.text = chain[0] as String
# Here I save the String from the label in the array chain
func save_it() -> void:
	# ========================== Variables ====================================
	# local variables temp number and lenght of the label
	var temp:String;
	var lenght:int = len(display.text);
	# ========================== Methods ======================================
	# loop through the label
	for element in range(lenght):
		# check if are equal to numbers
		if display.text[element] in NUMBERS.values() as String:
			# concatenated the numbers in one block
			temp += display.text[element];
			# if the lenght of the label it's out of the index
			if element+1 == lenght:
				# save it in the array
				chain.append(temp as float)
		# if exist an operator after a number
		elif display.text[element] in operators.values():
			# save first the number
			chain.append(temp as float)
			temp = ''# reset the number
			# save the operator
			chain.append(display.text[element])

# function to make the operations
func _operation(operator:String, n1:float, n2:float) -> float:
	match operator:
		operators.mul:
			n1 *= n2
		operators.div:
			n1 /= n2
		operators.add:
			n1 += n2
		operators.sub:
			n1 -= n2
	return n1;

# this function remove the values using the arithmetic operators 
func change_values(index:int)->void:
	# ========================== Variables ====================================
	var result:float;
	var op: String = chain[index];
	var num1: float = chain[index - 1];
	var num2: float = chain[index + 1];
	var elements: Array = [num1,op,num2];
	# ========================== Methods ======================================
	# instead the function _operation
	result = _operation(op,num1,num2);
	# through the chain
	chain.insert(index, result);
	for element in elements:
		chain.erase(element);
	# inserting new value

func _reading_the_chain() -> void:
	# ========================== Variables ====================================
	var resizing:bool = true;
	var length: int = 0;
	# chain = [66,+,5,'*',8,/,22,-,33,*,4]; size = 11
	# ========================== Methods ======================================
	while resizing:
		print("Dentro del loop while infinito")
		length = chain.size();
		if length == 1:
			resizing = false;
		for element in range(length):
			print("Dentro del loop for del array")
			if operators.mul in chain or operators.div in chain:
				print("Multiply and Divide!")
				if typeof(chain[element]) == TYPE_STRING &&  chain[element] == operators.mul:
					change_values(element);
					print("Cadena: ",chain);
					break;
				elif typeof(chain[element]) == TYPE_STRING &&  chain[element] == operators.div:
					change_values(element);
					print("Cadena: ",chain);
					break;
			elif operators.add in chain or operators.sub in chain:
				print("Adding and Substraction!")
				if typeof(chain[element]) == TYPE_STRING &&  chain[element] == operators.add:
					change_values(element);
					print("Cadena: ",chain);
					break;
				elif typeof(chain[element]) == TYPE_STRING &&  chain[element] == operators.sub:
					change_values(element);
					print("Cadena: ",chain);
					break;

func _on_Erase_pressed():
	# reset all the text
	display.text = ""
	# reset the arrays
	chain.clear()

func _on_Delete_pressed():
	# get the size of the label
	var get_size_display:int = len(display.text) - NUMBERS.one; 
	# this avoid that len comes less than 0 i.e. -1
	if get_size_display >= 0:
		display.text[get_size_display] = '';

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
