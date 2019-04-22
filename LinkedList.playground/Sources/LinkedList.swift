import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

// Inserting
extension LinkedList {
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        //In the case where you’re pushing into an empty list, the new node is both the head and tail of the list.
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        //Like before, if the list is empty, you’ll need to update both head and tail to the new node.
        //Since append on an empty list is functionally identical to push, you simply invoke push to do the work for you.
        guard !isEmpty else {
            push(value)
            return
        }
        
        //In all other cases, you simply create a new node after the tail node.
        //Force unwrapping is guaranteed to succeed since you push in the isEmpty case with the above guard statement.
        tail?.next = Node(value: value)
        
        //Since this is tail-end insertion, your new node is also the tail of the list.
        tail = tail?.next
    }
    
    public mutating func node(at index: Int) -> Node<Value>? {
        //You create a new reference to head and keep track of the current number of traversals.
        var currentNode = head
        var currentIndex = 0
        
        //Using a while loop, you move the reference down the list until you’ve reached the desired index.
        //Empty lists or out-of-bounds indexes will result in a nil return value.
        while currentNode != nil && currentIndex < index {
            currentIndex += 1
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    
    //@discardableResult lets callers ignore the return value of this
    //method without the compiler jumping up and down warning you about it.
    @discardableResult
    public mutating func insert(value: Value, after node: Node<Value>) -> Node<Value> {
        
        //In the case where this method is called with the tail node, you’ll call the functionally equivalent append method.
        //This will take care of updating tail.
        guard tail != nil else {
            append(value)
            return tail!
        }
        
        //Otherwise, you simply link up the new node with the rest of the list and return the new node.
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    /*
     |----------------------------------------------------------------------------------------------------------------------------|
     |                  |        Push       |       Append      |       insert(after:)    |                node(at:)              |
     |----------------------------------------------------------------------------------------------------------------------------|
     | Behaviour        |   insert at head  |   insert at tail  |   insert after a node   |     returns a node at a given index   |
     |----------------------------------------------------------------------------------------------------------------------------|
     | Time complexity  |        O(1)       |        O(1)       |            O(1)         |   O(i), where `i` is the given index  |
     |----------------------------------------------------------------------------------------------------------------------------|
     */
}

// Removing
extension LinkedList {
    // By moving the head down a node, you’ve effectively removed the first node of the list.
    // ARC will remove the old node from memory once the method finishes, since there will be no more references attached to it.
    // In the event that the list becomes empty, you set tail to nil.
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        // If head is nil, there’s nothing to remove, so you return nil.
        guard let head = head else {
            return nil
        }
        
        // If the list only consists of one node, removeLast is functionally equivalent to pop.
        // Since pop will handle updating the head and tail references, you’ll just delegate this work to it.
        guard head.next != nil else {
            return pop()
        }
        
        //You keep searching for a next node until current.next is nil.
        //This signifies that current is the last node of the list.
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        // Since current is the last node, you simply disconnect it using the prev.next reference.
        // You also make sure to update the tail reference.
        previous.next = nil
        tail = previous
        return current.value
    }
    
    @discardableResult
    // The unlinking of the nodes occurs in the defer block.
    // Special care needs to be taken if the removed node is the tail node, since the tail reference will need to be updated.
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    /*
     |-----------------------------------------------------------------------------------------|
     |                  |        Pop        |    Remove last   |          remove(after:)       |
     |-----------------------------------------------------------------------------------------|
     | Behaviour        |   remove at head  |  remove at tail  |   remove immediate next node  |
     |-----------------------------------------------------------------------------------------|
     | Time complexity  |        O(1)       |        O(n)      |            O(1)               |
     |-----------------------------------------------------------------------------------------|
     */
}
