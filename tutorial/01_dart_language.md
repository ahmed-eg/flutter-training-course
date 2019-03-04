
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


## Symbols
can be used like type and reflection in C#


# Functions
Normal function
```
var myFunction(int parameter1){

}
myFunction(100);
```
with optional parameters
```
var myFunction([int parameter1]){

}
myFunction(100);
//or
myFunction(); // parameter1 will be null
```
Optional named parameters
```
var myFunction({int parameter1,int parameter2}){

}
myFunction();
//or
myFunction(parameter1: 11, parameter2: 100);
```
with required parameter
```
myFunction(parameter1: 11, @required parameter2: 100);
```
Default value
```
var myFunction({int parameter1 = 10,int parameter2}){

}
myFunction(parameter1: 11, parameter2: 100); // overwrite the parameter1 value
```

## Cascade notation
You can do this like c#
```
var myClass = MyClass();
myClass.name = "My Name";
myClass.age = 10;
```
OR
```
MyClass() // Get an object.
  ..name = "My Name" // Use its members.
  ..age = 30;
```

## Throw
```
throw FormatException("Expected description!");
// OR
throw "Expected description!";
```
## Catch
```
try {
  // do somthing wrong here
 
} on OutOfLlamasException {
  // A specific exception
  
} on Exception catch (e) {
  // Anything else that is an exception
  print('Unknown exception: $e');
} catch (e) {
  // No specified type, handles all
  print('Something really unknown: $e');
}
```
Rethow
```
try{

}catch(err){
  // do somthing
  rethrow; // Allow callers to see the exception.
}
```
finally
```
try {
  
} finally {
  // Always clean up, even if an exception is thrown.
  
}
```

## static variables and functuions
Same like C#

## operations
Same like C#


# Class
```
class MyClass {
    String name;
    int age;
    
    MyClass(this.name, this.age);

    // Named constructor
    MyClass.default() {
      name = "Default Name";
      age = 0;
    }
}
```

# operators
```
class MyClass {
    String name;
    int age;
    
    MyClass(this.name, this.age);
    
    operator == (MyClass myClass) => myClass.name == name; // if same name
}
```

## abstract and interfaces

abstract same as c# but no interface in Dart
```
// you can impelement the abstract class as follow
class MyClass extends ParentClass{
```

## Adding features to a class: mixins
Mixins are a way of reusing a class’s code in multiple class hierarchies.

To use a mixin, use the `with` keyword followed by one or more `mixin` names.
```
class Musician extends Performer with Musical {
  // ···
}
```

## Generics
same as c#

# Using libraries

import dart lib
```
import 'dart:html';
```
import another custom class
```
import 'package:test/test.dart';
```
import with label
```
import 'package:test/test.dart' as test;
test.myFunction();
```

import one function
```
import 'package:test/test.dart' show myFunction;
```

import except one function
```
import 'package:test/test.dart' hide myFunction;
```
Lazily loading a library
```
import 'package:test/test.dart' deferred as test;
//When you need the library, invoke loadLibrary() using the library’s identifier.

Future myFunction() async {
  await test.loadLibrary();
  test.doSomthing();
}
```

## Asynchrony
same as c# excep it returns `Future` instade of `Task` in C#

also you can get the result using `then` function

```
Future<int> myTask() async {
}

myTask().then((result){
  
}).catchError((err){
  
});

```
