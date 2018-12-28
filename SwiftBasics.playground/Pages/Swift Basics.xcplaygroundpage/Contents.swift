import UIKit;
import AVFoundation;

//: # My Big Swift Notebook
//:
//: ## Whitespace
//:
//: Whitespace are all the characters that will be ignored during lexing by the Swift compiler. Whitespace is any of the following:
//: - All the characters that are not displayed as characters like blanks, tabs, newlines, linebreaks, etc.
//: - All comments
//:   - Single line comments // ...
//:   - Multiple line comments /\* ... \*/
//: TODO: this explanation could be improved by pointing out that whitespace will not be turned into a token provided to the parser. The only whitespace that will reach the parser is any whitespace contained in String literals.
//:
//: ### Consistent whitespace on both sides
//:
//: Swift likes balance of whitespace around its operators, as demonstrated in the statements below.

var monsterHealth=19;
var heroHealth = 51;

//: The following statements would be invalid and throw an error:
//:
//: error: Swift Basics.xcplaygroundpage:37:20: error: '=' must have consistent whitespace on both sides
//:
//: Try it out by removing the comments.

// var unlimitedPower =100;
// var fuelLevel= 800;
//: In case you wonder what is the reasoning behind that balancing, the statement below and its error message might point you in the direction. In *+2*, the + is the unary sign operator, not the adding operator. In Swift, operators can be overloaded, which is also true for the assignment operator =. Thus, the Swift lexer can never be sure what monsterHealth =19 would mean in any given situation. Such problems might be mitigated by balancing whitespace around operators.
//:
//: error: consecutive statements on a line must be separated by ';'
// monsterHealth = monsterHealth +2;

//: ### Comments
//:
//: The reasoning for comments is to comment to the later self or collaborators the train of thoughts behind a piece of code.
//:
//: Use // to create single line comments. All text after // on a given line will be ignored by the compile.
//:
//: Use /\* and \*/ to create mulitple lines of comments. All text between /\* and \*/ will be ignored by the compiler.
//: Differently from other programming languages Swift allows comments to be nested. Experiment with that, it will be unused to programmers experienced with other languages.
//:

// This line will be ignored by the compiler.
// This line, too. But the next three lines will be processed.
var firstname:String = "Jonathan";
var middlename:String = "Livingston";
var surname:String = "Seagull";

/*
 Everything here is a multiple line comment and will be ignored
 by the compiler.
 */

//: ## Statements
//:
//: Statements in Swift can be terminated by either of both:
//: - the Statement Terminator *;*
//: - the newline character
//: Only if multiple statements appear in one and the same line they need to be separated by the statement terminator.
//:
//: A statement can be expanded to expressions. Operators can operate on expressions.

print("Hello, World!");
print(firstname);

//: ## Variables and Constants
//:
//: Variables and constants can hold values of their declared data types. For data types see below. If the data type is not explicitly declared, the Swift compiler will try to infer the data type from the context. While variables can change their value later on, constants will forever be bound to their first assigned value. Variables and constants can have values or not, in the latter case, they have the value *nil*. This possibility is handled by the Optional concept, see below.

// declaring a variable, in this case it's integer typed
var myVariable1:Int = 35;
// another integer typed variable where the data type is infered by the compiler from the context
var myVariable2 = 35;
// declaring a constant. Trying to change the value later would resolve in an error
let myConstant1 = 21;
// the following line would lead to the following error:
// error: cannot assign to value: 'myConstant1' is a 'let' constant
// myConstant1 = 35;

//: ## Data Types
//:
//: Swift supports multiple data types:
//: - Int: Integer numbers
//: - Float: Floating point numbers
//: - Double: double precision floating point numbers
//: - Bool: boolean values
//:   - true
//:   - false
//: - String: strings of characters, text
//: - ADTs: since Swift is an object oriented language, there is the countless number of abstract data types defined in all those classes around. Even you yourself might one day contribute to the number of data types out there.

var int1:Int = 35;
var float1:Float = 3.14159265;
var double1:Double = 3.14159265;
var bool1:Bool = false;
bool1 = bool1 || !bool1;
bool1 = !bool1;
var string1:String = "Hello, World!";

//: ### Arrays

//: See below a listing how arrays can be declared and initialized. Constants arrays cannot be changed later on, i.e. no elements can be added and no existing elements can be changed.

var array1:[Int] = [1,2,3,4,5];
array1 += [6];
let array2:[Int] = [1,2,3,4,5];
// Left side of mutating operator isn't mutable: 'array2' is a 'let' constant
// array2 += [6];
// Cannot assign through subscript: 'array2' is a 'let' constant
// array2[2] = 3;

//: ## Functions
//:
//: In Swift, functions are a special case of closures.
//: Most simple example of a function: just a function name with an empty argument list and not return value -> a void function. This function can already be called, but to no great effect. Basically, a function is a piece of functionality that can be re-used. Thus, a function conceptionally enables modularization.

func getMilk() {
    print("Going to buy 2 cartons of milk.");
    // go to the shops
    // buy 2 cartons of milk
    // pay money
    // return home
}
getMilk();

//: Always getting 2 cartons of milk may not be sophisticated enough for all applicable situations. It would be nice if the function could be *parameterized* so we can order arbitrary numbers of cartons of milk.

func getMilk(numberOfCartons:Int){
    let pricePerCarton:Int = 2;
    print("Going to buy \(numberOfCartons) cartons of milk for €\(numberOfCartons * pricePerCarton).");
}
getMilk(numberOfCartons:4);

//: Wouldn't it be great to have a function that not only takes an input but also can return a value.

func getMilk(numberOfCartons:Int,shoppingFunds:Int)->Int{
    let pricePerCarton:Int = 2;
    let total = pricePerCarton * numberOfCartons;
    let change = shoppingFunds - total;
    print("Going to buy \(numberOfCartons) cartons of milk for €\(total), bringing back €\(change) as change.");
    return change;
}

print("Hello master, here's your €\(getMilk(numberOfCartons:4,shoppingFunds:10)) change.");
print("Hello master, here's your €\(getMilk(numberOfCartons:5,shoppingFunds:10)) change.");
print("Hello master, here's your €\(getMilk(numberOfCartons:6,shoppingFunds:10)) change.");

//: ### What is the return value of a void function
func voidFunction(){
    
}
let voidReturnValue = voidFunction();
print("Return value of void function is \(voidReturnValue).");
//: The compiler says: **Constant 'voidReturnValue' inferred to have type '()', which may be unexpected.** So, the questions arises: what data type / value is this: *()*? Very strange. And unexpected :-).

//: ## Control Structures

//: ### Conditional Statement (If-Else statements)

func loveCalculator(yourName:String,theirName:String)->String{
    let loveScore = Int.random(in:1...100);
    let result:String = "Your love score is \(loveScore).";
    if loveScore > 80 {
        return "\(result) You love each other like Kanye loves Kanye.";
    } else if loveScore > 40 {
        return "\(result) You go together like coke and mentos."
    } else {
        return "\(result) No love possible.";
    }
}
print("Compatibility assessment for George and Angela is: \(loveCalculator(yourName:"George", theirName:"Angela"))");

//: ### Loops

let arrayOfNumbers = [1,5,3,6,2,7,23,34];

//: #### For-in loop
//:
//: Can be used to iterate over elements in a collection, like an array. The first keyword is *for*, then follows a constant that will be used as a reference to an element within the loop, afterwards the keyword *in* and then a data structure which will be iterated over. Let's use it to sum over the elements in the array $arrayOfNumbers.

var sum:Int = 0;
for number in arrayOfNumbers {
    sum += number;
    print("Found element \(number).");
}
print("The sum of all the elements in \(arrayOfNumbers) is \(sum).");

//: For-in loop can also be used to repeat code for a given number or iterations using a sequence. Let's use it to do a count-down from 10 to 0.
for x in 0...10 {
    print("Countdown at \(10-x).");
}
print("Lift off.");

//: A step size can be introduced into a sequence by filtering the elements in given sequence using the **where** clause. E.g. iterating over even numbers between 0 and 20:

for x in 0...20 where x % 2 == 0{
    print("iterating over even numbers between 0 and 20: \(x).");
}

//: ## Exception Handling
//:
//: When a function throws an error, it changes the flow of your program.
//: These are the 4 ways of dealing with errors in Swift:
//: - Propagate the error from a function to the client (i.e. the code that calls the function)
//: - handle the error using a do-catch statement
//: - handle the error as an optional value
//: - assert (to the compiler) that the error will not occur, if you are damn sure of what you're doing
//: Code that could throw an exception has to be wrapped in a do-try-catch construct. Or else we get the compiler error: **Call can throw, but it is not marked with 'try' and the error is not handled.** As in:
var audioPlayer = AVAudioPlayer();
do{
    audioPlayer = try AVAudioPlayer(contentsOf: URL(string: "http://some.invalid.url.com")!);
    audioPlayer.play();
    print("played ding audio just for you.");
} catch {
    print("Guess what, something went wrong: \(error).");
}
//: The AVAudioPlayer initializer will throw an error, because the URL cannot be resolved to a resource on the local file system. Printing the error shows this message: **Guess what, something went wrong: Error Domain=NSOSStatusErrorDomain Code=2003334207 "(null)".**. The meaning of this freaking error message can be looked up here: https://www.osstatus.com.
//:
//: If a function can throw errors, it is called a **throwing function**. Such a function declaration looks like this:

func canThrowErrors() throws -> String {
    return "Hello, World!";
}

//: ## Strings
//: ### String formatting
//: Let's try to print a floating point number with leading zeros.
var floatSample:Double = 3.14159265;
print(String(format:"%016.8f", floatSample));

//: To clarify: The number x after %0 as in %0x is the minimum width of the complete formatted String representing the original number, including the digits before the decimal separator, the decimal separator and the digits after the decimal separator. x can have multiple digits.

//: ### String interpolation
//:
//: Mixing the value of expressions into a String can be done using *String Interpolation*. Those expressions can be simple variable expressions or any other expressions like (ideally non-void) function calls or operator expressions like *41+1*. E.g. displaying the result of the operator expression *1 + 1* can be done like so:

print("The sum of 1 + 1 is \(1+1).");
func getSum(arg1:Int, arg2:Int)->Int{
    return arg1 + arg2;
}
print("The sum of 1 + 1 is \(getSum(arg1:1,arg2:1)).");

//: # Appendix
//: ## Swift Playground Markup Language
/*:
 Let's test multiple lines of markup text.
 This is what failed earlier and me no sure for what reason of the many thinkable.
 */

//: # Bonus
//: ## 99 bottles of beer on the wall

// this function gives you the lyrics for the great bottles of beer song for a given initial number of bottles.
func bottlesOfBeer(initialNumberOfBottles:Int)->String{
    var lyrics:String = "";
    
    for i in (1...initialNumberOfBottles).reversed() {
        let newLine = "\n\(i) bottle\(i==1 ? "":"s") of beer on the wall, \(i) bottle\(i==1 ? "":"s") of beer.\nTake one down and pass it around, \(i-1) bottle\(i-1==1 ? "":"s") of beer on the wall.\n";
        lyrics += newLine;
    }
    lyrics += "\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, \(initialNumberOfBottles) bottles of beer on the wall.\n";
    
    return lyrics;
}

print(bottlesOfBeer(initialNumberOfBottles:10));

//: ## Fibonacci numbers
// returns the n-th Fibonacci number starting with 0
func getNthFibonacciNumberRecursive(n:Int)->Int{
    if n == 1{
        return 0;
    } else if n == 2 {
        return 1;
    } else {
        return getNthFibonacciNumberRecursive(n:n-1) + getNthFibonacciNumberRecursive(n:n-2);
    }
}

func getNthFibonacciNumberIterative(n:Int)->Int{
    var f1:Int = 0;
    var f2:Int = 1;
    if (n==1) {
        return f1;
    } else if (n==2) {
        return f2;
    } else {
        var buffer:Int = 0;
        for _ in 3...n {
            buffer = f1 + f2;
            f1 = f2;
            f2 = buffer;
        }
        return buffer;
    }
    
}


for i in 1...9 {
    print("\(i). Fibonacci has value \(getNthFibonacciNumberIterative(n:i)).");
}

class Table {
    let name:String
    let capacity:Int
    
    init(description:String, capacity:Int){
        name = description
        self.capacity = capacity
    }
}

func getTable(forNumberOfGuests capacity:Int)->Table?{
    let myTables:[Table] = [Table(description:"Table1", capacity:1), Table(description:"Table2", capacity:2), Table(description:"At the stage", capacity:3), Table(description:"Family table", capacity:4)]
    for i in 1..<myTables.count{
        let table = myTables[i]
        if table.capacity == capacity {
            return table;
        }
    }
    return nil
}
if let myTable = getTable(forNumberOfGuests: 3){
    print("We've reserved this table for you: \(myTable.name)")
}
