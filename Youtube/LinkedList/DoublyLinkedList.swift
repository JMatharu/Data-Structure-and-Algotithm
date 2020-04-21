/*
    Doubly Linked List
 */

class ListNode<T>: CustomStringConvertible {
    
    var val: T
    var next: ListNode?
    weak var previous: ListNode?
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

struct LinkedList<T> {
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

extension LinkedList {
    // Add to last (this will be O(1) because of using tail pointer)
    mutating func append(_ value: T) {
        let newNode = ListNode(value)
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        newNode.previous = tail
        tail = newNode
    }
    
    // Add to first O(1)
    mutating func push(_ value: T) {
        let newNode = ListNode(value)
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.next = head
        head?.previous = newNode
        head = newNode
    }
    
    // O(n)
    mutating func insert(_ value: T, at index: Int) {
        let newNode = ListNode(value)
        guard !isEmpty else {
            if index > 0 || index < 0 { print("Unable to insert at index \(index)"); return }
            head = newNode
            tail = newNode
            return
        }
        
        guard !(index < 0) else { print("Unable to insert at index \(index)"); return }
        
        if length == index {
            append(value)
        } else {
            var temp = head
            var counter = 0
            while counter < index - 1 {
                temp = temp?.next
                counter += 1
            }
            newNode.next = temp?.next
            temp?.next = newNode
        }
    }
}

// Delettion
extension LinkedList {
    // Delete from begining O(1)
    mutating func pop() {
        guard !isEmpty else {
            print("Noting to remove")
            return
        }
        if length == 1 { head = nil; tail = nil; return }
        head = head?.next
        head?.previous = nil
    }
    
    mutating func deleteFromEnd() {
        guard !isEmpty else {
            print("Noting to remove")
            return
        }
        if length == 1 { head = nil; tail = nil; return }
        tail = tail?.previous
        tail?.next = nil
    }
    
    // O(n)
    mutating func delete(at index: Int) {
        guard !isEmpty else {
            if index > 0 || index < 0 { print("Unable to delete at index \(index)"); return }
            head = nil
            tail = nil
            return
        }
        guard !(index < 0) else { print("Unable to delete at index \(index)"); return }
        
        var temp = head
        var counter = 0
        while counter < index - 1 {
            temp = temp?.next
            counter += 1
        }
        let nextNode = temp?.next
        let previousNode = temp?.previous
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        temp = nil
    }
}

// Reverse
extension LinkedList {
    func reverse() {
        
    }
}

var list = LinkedList<String>()
list.push("e")
list.push("f")
list.head //f <-> e
list.append("a")
list.append("b")
list.append("c")
list.append("d")
list.head //f <-> e <-> a <-> b <-> c <-> d
list.push("2")
list.head //2 <-> f <-> e <-> a <-> b <-> c <-> d
list.insert("1", at: 3)
list.head //2 <-> f <-> e <-> 1 <-> a <-> b <-> c <-> d
list.pop()
list.head //f <-> e <-> 1 <-> a <-> b <-> c <-> d
list.deleteFromEnd()
list.head //f <-> e <-> 1 <-> a <-> b <-> c
list.delete(at: 2)
list.head //f <-> 1 <-> a <-> b <-> c
list.delete(at: 3) // Wrong here
list.head
