import Foundation

public class QueueLinkedList<T>: Queue {
    
    private var list = DoublyLinkedList<T>()
    
    public init() {}
    
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var peek: T? {
        return list.first?.value
    }
    
    public typealias Element = T
    
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return list.description
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
 
 Note: Despite O(1) performance, it suffers from high overhead. Each
 element has to have extra storage for the forward and back reference.
 Moreover, every time you create a new element, it requires a
 relatively expensive dynamic allocation. By contrast QueueArray does
 bulk allocation which is faster.
 */
