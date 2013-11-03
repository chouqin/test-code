/**
 * delare namepace for PHP
 * Any other language using namepace (for example, cpp) can also use this
 */
namespace php tutorial

/**
 * definition of struct
 * */
struct SharedStruct {
  1: i32 key
  2: string value
}

/**
 * definition of operation type
 */
enum Operation {
  ADD = 1,
  SUBTRACT = 2,
  MULTIPLY = 3,
  DIVIDE = 4
}

/**
 * client call calculate using Word structure.
 */
struct Work {
  1: i32 num1 = 0,
  2: i32 num2,
  3: Operation op,
  4: optional string comment,
}

/**
 * Server return exception
 * */
exception InvalidOperation {
  1: i32 what,
  2: string why
}

/**
 * Definition of Service
 * Service can be implemented by any language(in our example, Python)
 * and called by any language(in our example, php)
 * */
service Calculator {

   void ping(),

   i32 add(1:i32 num1, 2:i32 num2),

   i32 calculate(1:i32 logid, 2:Work w) throws (1:InvalidOperation ouch),

   oneway void zip()

   SharedStruct getStruct(1: i32 key)
}
