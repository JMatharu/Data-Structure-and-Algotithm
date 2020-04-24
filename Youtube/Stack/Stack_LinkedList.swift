/*
 Stacks - Using Arrays
 */

public class ListNode<T>: CustomStringConvertible {
    
    public var val: T
    public var next: ListNode?
    public init(_ val: T) {
        self.val = val
        self.next = nil
    }
    
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) -> " + String(describing: next)
    }
}

struct Stack<T> {
    var top: ListNode<T>?
    
    var isEmpty: Bool {
        return top == nil
    }
    
    // O(1)
    mutating func push(_ val: T) {
        let newNode = ListNode(val)
        
        guard !isEmpty else {
            top = newNode
            return
        }
        
        newNode.next = top
        top = newNode
    }
    
    // O(1)
    mutating func pop() -> T? {
        guard !isEmpty else {
            print("All elements of stack are being removed")
            return nil
        }
        let topItem = top?.val
        top = top?.next
        
        return topItem
    }
    
    // O(1)
    func peek() -> T? {
        guard !isEmpty else {
            print("All elements of stack are being removed")
            return nil
        }
        return top?.val
    }
}

var stack = Stack<Int>()
stack.top //nil
stack.push(1)
stack.top // 1
stack.push(2)
stack.push(3)
stack.top //3 -> 2 -> 1
stack.pop() // 3
stack.top // 2 -> 1
stack.peek() // 2
stack.top // 2 -> 1
