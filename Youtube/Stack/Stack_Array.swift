/*
 Stacks - Using Arrays
 */

struct Stack<T>: CustomStringConvertible {
    var elements = [T?]() 
    
    private var index: Int = -1
    
    var description: String {
        guard index >= 0 else {
            return "Stack is empty"
        }
        var temp = "--- Top ---\n"
        
        for item in elements.reversed() {
            if let item = item {
                temp += "\(item)\n"
            }
        }
        temp += "--- End ---"
        return temp
    }
    
    // O(1)
    mutating func push(_ val: T) {
        elements += [val]
        index += 1
    }
    
    // O(1)
    mutating func pop() -> T? {
        guard index >= 0 else {
            print("All elements of stack are being removed")
            return nil
        }
        let item = elements[index]
        cleanUp()
        index -= 1
        return item
    }
    
    // O(1)
    func peek() -> T? {
        guard index >= 0 else {
            print("All elements of stack are being removed")
            return nil
        }
        return elements[index]
    }
    
    private mutating func cleanUp() {
        var newElements: [T?] = [T?]()
        for index in 0..<index {
            newElements += [elements[index]]
        }
        self.elements = newElements
    }
}

var stack = Stack<Int>()
stack.elements
stack.push(1)
stack.elements
stack.push(2)
print(stack)
//--- Top ---
//2
//1
//--- End ---
stack.pop() // 2
stack.elements //[1]
stack.pop() // 1
stack.pop() // nil (All elements of stack are being removed)
stack //Stack is empty
stack.push(3)
print(stack)
//--- Top ---
//3
//--- End ---
stack.push(4)
stack.peek() // 4
print(stack)
//--- Top ---
//4
//3
//--- End ---
