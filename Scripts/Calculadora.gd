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
var sort_operators:Array;
var chain:Array;
# ========================================================================
# Reset the text 'Probando' instead is empty
func _ready():
	display.text = "";

func _on_Equal_pressed():
	save_it();
	_reading_the_chain();
# Here I save the String from the label in the array chain
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
func remove_values(list:Array,index:int,op:String,n1:float,n2:float)->void:
	# Variables
	var result:float;
	# instead the function _operation
	result = _operation(op,n1,n2);
	# insert and remove values
	list.insert(index, result);
	list.remove(index - 1);
	list.remove(index + 1);
	print("Values: ",list)

func _reading_the_chain() -> void:
	# Variables
	var resizing: bool = true;
	# chain = [66,+,5,*,8,/,22,-,33,*,4]; size = 11
	# replantear el loop while con el counter
	while resizing:
		for index in range(chain.size()):
			# multiply and divide
			if operators.mul in chain or operators.div in chain:
				print("Multiply and Divide there it is");
				if operators.mul == chain[index] as String:
					# list, index, operator, num1, num2
					remove_values(chain,index,operators.mul,chain[index-1],chain[index+1]);
					print("Cadena: ",chain);
					break;
				elif operators.div == chain[index] as String:
					# list, index, operator, num1, num2
					remove_values(chain,index,operators.div,chain[index-1],chain[index+1]);
					print("Cadena: ",chain);
					break;
			elif operators.add in chain or operators.sub in chain:
				print("Adding and Substraction there it is");
				if operators.add == chain[index] as String:
					# list, index, operator, num1, num2
					remove_values(chain,index,operators.add,chain[index-1],chain[index+1]);
					print("Cadena: ",chain);
					break;
				elif operators.sub == chain[index] as String:
					# list, index, operator, num1, num2
					remove_values(chain,index,operators.sub,chain[index-1],chain[index+1]);
					print("Cadena: ",chain);
					break;
		if chain.size() == 1:
			resizing = false;

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
