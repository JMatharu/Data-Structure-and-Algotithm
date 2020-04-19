/*
    Singly Linked List
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

public struct LinkedList<T> {
    public var head: ListNode<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var length: Int {
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
extension LinkedList {
    
    // insert at tail O(n)
    mutating func append(_ val: T) {
        insertAtLast(val)
    }
    
    // insert at head O(1)
    mutating func push(_ val: T) {
        insertAtFirst(val)
    }
    
    // O(n), where `n` is the given index
    mutating func insert(_ val: T, at index: Int) {
        if index == 0 {
            insertAtFirst(val)
        } else {
            var currentIndex = 0
            var temp = head
            while temp?.next != nil && currentIndex < index {
                temp = temp?.next
                currentIndex += 1
            }
            if currentIndex < index {
                print("Index is invalid, valid range is 0 to \(currentIndex)")
            } else {
                let newNode = ListNode(val)
                newNode.next = temp?.next
                temp?.next = newNode
            }
        }
    }
    
    private mutating func insertAtFirst(_ val: T) {
        let newNode = ListNode(val)
        newNode.next = head
        head = newNode
    }
    
    private mutating func insertAtLast(_ val: T) {
        let newNode = ListNode(val)
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        temp?.next = newNode
    }
}

// Deletion
extension LinkedList {
    
    // O(1)
    mutating func deleteAtFirst() {
        guard !isEmpty else {
            print("List is empty")
            return
        }
        head = head?.next
    }
    
    // O(n)
    mutating func deleteAtLast() {
        guard !isEmpty else {
            print("List is empty")
            return
        }
        var temp = head
        var previousNode: ListNode<T>?
        while temp?.next != nil {
            previousNode = temp
            temp = temp?.next
        }
        if temp === head {
            head = nil
        } else {
            previousNode?.next = nil
        }
    }
    
    // O(n), where `n` is the given index
    mutating func deleteAtIndex(_ index: Int) {
        guard !isEmpty else {
            print("List is empty")
            return
        }
        var temp = head
        var currentIndex = 0
        while currentIndex < index - 1 {
            temp = temp?.next
            currentIndex += 1
        }
        
        var nextNode = temp?.next
        temp?.next = nextNode?.next
        nextNode = nil
    }
}

let node1 = ListNode<Int>(1)
let node2 = ListNode<Int>(2)
let node3 = ListNode<Int>(3)

node1.next = node2
node2.next = node3

print(node1) // 1 -> 2 -> 3

var list = LinkedList<String>()
list.insert("One", at: 0)
list.insert("Two", at: 0)
list.insert("Four", at: 1)
list.insert("Five", at: 2)
list.insert("Six", at: 2)
list.insert("Seven", at: 100) // Index is invalid, valid range is 0 to 4
list.append("one")
list.append("two")
list.append("three")
list.push("A")
list.push("Q")
list.push("Z")



print(list.head!) //Z -> Q -> A -> Two -> One -> Four -> Six -> Five -> one -> two -> three

list.deleteAtFirst()
print(list.head!) // Q -> A -> Two -> One -> Four -> Six -> Five -> one -> two -> three

list.deleteAtLast()
print(list.head!) // Q -> A -> Two -> One -> Four -> Six -> Five -> one -> two

list.deleteAtIndex(2)
print(list.head!) //Q -> A -> One -> Four -> Six -> Five -> one -> two

print(list.length) // 8
