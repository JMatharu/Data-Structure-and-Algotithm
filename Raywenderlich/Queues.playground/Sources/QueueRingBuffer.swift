import Foundation

public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: T? {
        return ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return ringBuffer.description
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
 
 Note: The ring buffer-based queue has the same time complexity for
 enqueue and dequeue as the linked list implementation. The only
 difference is the space complexity. The ring buffer has a fixed size
 which means that enqueue can fail.
 */
