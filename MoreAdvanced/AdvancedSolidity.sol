// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
// Mappings
// Enums
// Structs
// View and Pure Functions
// Function Modifiers
// Events
// Constructors
// Inheritance
// Transferring ETH
// Calling external contracts
// Import statements
// Solidity Libraries

contract Mapping {
    // like an object in JS
    // so you have a key and value
    // eg. {name:"Keith", age:"22"}

    mapping(address=>string) public moods;
    // you can access someones mood through there address like
    // moods[0xABCDEF....] => string

    function getMood(address user)public view returns (string memory){
        return moods[user];
    }

    function setMood(string memory mood) public {
        moods[msg.sender] = mood;
    }
}

// N/A 
// Solidity has 3 types of storage 
// 1. Memory
// 2. Storage
// 3. Calldata (rarely used )

/*
types of variables 
fixed and dynamic 

address is a fixed data type 
strings can be anything 

you specify memory when you don't know how big it will be and you want to place it in the heap like RAM not cache

anything stored as a variable in the contract and not in a function in the contract
 goes into storage eg. harddisk it will never change 

 */

 contract Enums{
    //  Short for enumerators
    // human readable types for a set of values

    // Possible status in a todo application
    /**
    0. Todo
    1. In Progress
    2. Done
    3. Cancelled
     */

// Strings are not the best to represent status
// Dynamic length will cause expensive gas fees
// You have to validate each string input to make sure it matches one of your status
// so the option below is not the best


    // mapping (uint256=>string) todos;
    //  function updateStatus(uint256 id, string memory newStatus) public {
    //      todos[id]= newStatus;
    //  }

     // id => status mapping

/*
     mapping (uint256=>uint256) todos;

     function addTask(uint256 id) public{
         todos[id]=0;
     }

    function updateStatus(uint256 id, uint256 newStatus) public{
        require(newStatus < 4 , "Invalid input");
        todos[id]= newStatus;
    }

     function getStatus(uint256 id) public view returns (uint256){
         return todos[id];
     }

*/
    //  the method above is good but not the best because if the status are more than 4 there will be so much to look through

    // internally solidity stores enums as numbers from 0 going up eg. 0 will represent

    enum Status{
        TODO,
        IN_PROGRESS,
        DONE,
        CANCELLED
    }

    // id => status mapping
     mapping (uint256=>Status) todos;

     function addTask(uint256 id) public{
         todos[id]=Status.TODO;
     }

     function updateStatus(uint256 id, Status newStatus) public{
        todos[id]= newStatus;
    }

    // you can break down the function above to functions like the one below

    function markInProgress(uint256 id) public{
            todos[id]= Status.IN_PROGRESS;
        }


    function getStatus(uint256 id) public view returns (Status){
         return todos[id];
     }


 }

 contract Structs{
    //  Strucs are like classes without any methods
    // Basically a way to hold a bunch of related info together without methdos
    // Structs are better for gas

    /**
    What does a TODO app need 
    Description of the task 
    Status of the task
    Unique Id of the task
    Title
     */
    enum Status{
        TODO,
        IN_PROGRESS,
        DONE,
        CANCELLED
    }  

     struct Task{
         string title;
         string description;
         Status status;
     }

     mapping(uint256 => Task) tasks;

     function deleteTask(uint256 id) public{
         delete tasks[id];
     }

     function addTask (uint256 id, string memory title, string memory description) public {
         tasks[id] = Task({
             title:title,
             description:description,
             status: Status.TODO
         });
     }
     
 }

 contract ViewAndPureFucntions{

     /**
     Solidty has 3 kinds of keywords to indicate side effects of a function
     Side effects means something that changes the value of a variable beyond its own scope example below
      */

      uint y;

      function randomFunction () public{
          uint x = 0;
          x= 5;  // not a side effect 
          y = 5; // a side effect because it changes the value of y that will reflect beyond the function itself
      } 

      /**
      kind one - no keyword at all - modify or write to state 
      kind two - view funtcion - Reads from state but does not write to the state 
      kind three - pure function - Does not read or write to state 

      specify on the function to save on gas

      !!!!!!! pure and view functions are free
       */

    //    View
    function getY() public view returns (uint){
        return y;
    }

    // Pure
    function add(uint x, uint z) public pure returns (uint){
        return x+z;
    }

 }

 contract Modifiers{
     /**
     Code that is run before or after any other function call

     A function can have as many modifiers as you want
     multiple modifiers are run in the order specified 
     you can pass arguments to them

     used to restrict access to functions 
     used to validate the input of parameters
     prevent certain types of attacks(eg. reentrancy attacks)
      */

      address owner;

      constructor(){
          owner = msg.sender;
      }

      modifier onlyOwner() {
          require(msg.sender == owner, "Unauthorized" );
          _;

          // _; means run the rest of the code in this part 
      }

      /**
      To make it run after the function do this

      modifier onlyOwner() {
          _;
          require(msg.sender == owner, "Unauthorized" );
      }

      you can also put the _; in between two statements
      
       */
        // funtions that can only be run by the owner - the modifier will run before the function

       function someFunc1() public onlyOwner{
       }
       function someFunc2() public onlyOwner {
       }
       function someFunc3() public onlyOwner {
       }

 }