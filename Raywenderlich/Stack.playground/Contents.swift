example(of: "Using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedElemet = stack.pop() {
        print("Popped: \(poppedElemet)")
    }
}

example(of: "Initilizing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    
    var stack = Stack(array)
    print(stack)
    if let poppedElemet = stack.pop() {
        print("Popped: \(poppedElemet)")
    }
}

example(of: "Initilizing a stack from array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    if let poppedElemet = stack.pop() {
        print("Popped: \(poppedElemet)")
    }
}
