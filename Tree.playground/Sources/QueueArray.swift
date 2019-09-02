import Foundation

public struct QueueArray<T>: Queue {
    
    public typealias Element = T
    
    /*
     Using the features of Array, These operation is O(1)
     */
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    /*
     Using the features of Array, These operation is O(1)
     */
    public var peek: T? {
        return array.first
    }
    
    private var array: [T] = []
    public init() {}
    
    /*
     Resizing is an O(n) operation. Resizing requires the array to allocate
     new memory and copy all existing data over to the new array. Since
     this doesn’t happen very often (thanks to doubling the size each
     time), the complexity still works out to be an ammortized O(1).
     */
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    /*
     Removing an element from the front of the queue is an O(n)
     operation. To dequeue, you remove the element from the beginning
     of the array. This is always a linear time operation, because it requires
     all the remaining elements in the array to be shifted in memory.
     */
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray : CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

/*
 |-------------------------------------------------------------------|
 |      Operation   |        Best Case       |       Worst Case      |
 |-------------------------------------------------------------------|
 | enqueue          |          O(1)          |          O(1)         |
 |-------------------------------------------------------------------|
 | dequeue          |          O(n)          |          O(n)         |
 |-------------------------------------------------------------------|
 | Space Complexity |          O(n)          |          O(n)         |
 |-------------------------------------------------------------------|
 */
