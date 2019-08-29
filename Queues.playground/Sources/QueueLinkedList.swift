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
