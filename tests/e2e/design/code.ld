# comments are like this

# variables are like this
my_int = 5
my_float: f64 = 10	# you can put the type after the name for explicity
my_str: [u8] = "Hello"

# functions
fn add x y = x + y

## for multi-line functions use indentation
fn doSomethingWith x y =
	z = x * y
	z / x + y

## NOTE:
## last expression of a function means return this
## also, division always results in a float


# if else statements
if doSomething 5 10 == 5
	puts "First if"
else if doSomething 10 10 == 5
	puts "Second if"
else
	puts "Third else"
	pass			# can be used for empty indent blocks


# pointers
my_str = "Hello World!"		# pointers use [] for access
putchar [my_str]		# unlike C, this makes more sense (prints 'H')


# arrays
## there's only one type of array, and it is always fix sized
my_int_arr = {0, 1, 2, 3, 4, 5}
my_other_arr: i64[5]		# you can allocate arrays like this
				# this is an array of 5 integers

## arrays are actually pointers
printf "%d\n" [my_int_arr]	# prints 0


# data types
type Rectangle =
	width:  i64
	height: i64


# bounded functions
## you can bind functions to specific data types

fn Rectangle.area self =	# self here is a pointer to the instance
	self.width * self.height

## calling them is easy too
my_rect = Rectangle 5 5
printf "%d\n" my_rect.area


# loops
## there's only one loop, and that is the for loop

for i = 0; i < 10; i += 1
	printf "%d\n" i

for i in 0 to 10
	printf "%d\n" i

i = 0
for i < 10
	printf "%d\n" i
	i += 1

## but it does the job


# types

## Lord is also strictly typed and you need to explicitly cast types
## if you need to, like so:

printf "%f\n" (my_int as f64 + my_float)

## with this, you should be able to do anything basically
