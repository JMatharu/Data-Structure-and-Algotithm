/*
    Circular Linked List
 */

class ListNode<T>: CustomStringConvertible {
    
    var val: T
    var next: ListNode?
    init(_ val: T) {
        self.val = val
    }
    
    var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) <-> " + String(describing: next)
    }
}

struct CircularLinkedList<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    
    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var length: Int {
        guard !isEmpty else {
            return 0
        }
        
        var temp = head
        var count = 1
        while temp?.next != nil {
            temp = temp?.next
            count += 1
        }
        return count
    }
}

// Inserting
extension CircularLinkedList {
    mutating func append(_ val: T) {
        let newNode = ListNode(val)
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
        tail?.next = head
    }
}

var list = CircularLinkedList<Int>()
list.append(1)
list.head //1
list.tail //1
list.append(2)
list.head //1
list.tail //1
