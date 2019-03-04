
# Variables

## declare variable

- variable name has to start with small latter
- to declare a private variable use `_` before variable name for example `String _myVariable;` otherwise it will be public

## Default value
Uninitialized variables have an initial value of null. Even variables with numeric types are initially null, because numbers—like everything else in Dart—are objects.

## Any type variable
If an object isn’t restricted to a single type, specify the `Object` or `dynamic` type.
```
dynamic myNumber = 100;
```

## Assert value

You can assert the value type to insure the correct value in debug mode
```
assert(myNumber > 10);
```
> The assert() call is ignored in production code. During development, assert(condition) throws an exception unless condition is true.

also can add a message as a second argument
```
assert(myNumber > 10, "value has to be more than 10");
```

## String Expression

you can add a value of an expression inside string 

```
int myInt = 10;
String message = "You int is $myInt";
String message2 = "You int is ${myInt.toString()}";
```

## Final and const

If you never intend to change a variable, use final or const, either instead of var or in addition to a type. A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.) A final top-level or class variable is initialized the first time it’s used.

`const` is much like `const` in C#
and `final` in like `readonly` in C#

```
final int myNumber =1;
final myNumber =1;
```

The const keyword isn’t just for declaring constant variables. You can also use it to create constant values, as well as to declare constructors that create constant values. Any variable can have a constant value.

```
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

## List (Array)
Declare an Array:
```
List<int> myArray;
myArray = <int>{1,2,3};
myArray = {1,2,3};      // this works as well

```

Add new item to Array;
```
myArray.add(4);
myArray.addAll({5,6,7});  // add another list
```

## Maps
```
var employee = new Map();
employee['name'] = 'Employee Name';
employee['department'] = 'IT';

// OR

var employee = new Map();
employee[0] = Employee Name;
employee[1] = 'IT';

// OR

var employee = {'name' :'Employee Name','department':'IT'};
```
> the `new` can be removed, but it's better to stick with it so you'll not get confused when get back to C#

