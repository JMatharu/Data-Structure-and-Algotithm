import Foundation

public struct QueueStack<T>: Queue {
    
    public typealias Element = T
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.first : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        let printList = leftStack + rightStack.reversed()
        return printList.description
    }
}

/*
 |-------------------------------------------------------------------|
 |      Operation   |        Best Case       |       Worst Case      |
 |-------------------------------------------------------------------|
 | enqueue          |          O(1)          |          O(1)         |
 |-------------------------------------------------------------------|
 | dequeue          |          O(1)          |          O(1)         |
 |-------------------------------------------------------------------|
 | Space Complexity |          O(n)          |          O(n)         |
 |-------------------------------------------------------------------|
 
 Compared to the array-based implementation, by leveraging two
 stacks, you were able to transform dequeue(_:) into an amortized
 O(1) operation.
 Moreover, your two stack implementation is fully dynamic and
 doesn’t have the fixed size restriction that your ring-buffer-based
 queue implementation has.
 Finally, it beats the linked list in terms of spacial locality. This is
 because array elements are next to each other in memory blocks. So a
 large number of elements will be loaded in a cache on first access.
 
 Compare this to a linked list where the elements aren’t in contiguous
 blocks of memory. This could lead to more cache misses which will
 increase access time.
 */
