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
    private var temp: ListNode<T>? // Or call it tail
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ val: T) {
        if head == nil {
            head = ListNode<T>(val)
            temp = head
        } else {
            temp?.next = ListNode<T>(val)
            temp = temp?.next
        }
    }
}

let node1 = ListNode<Int>(1)
let node2 = ListNode<Int>(2)
let node3 = ListNode<Int>(3)

node1.next = node2
node2.next = node3

print(node1) // 1 -> 2 -> 3

var list = LinkedList<String>()
list.push("one")
list.push("two")
list.push("three")

print(list) //LinkedList<String>(head: Optional(one -> two -> three), temp: Optional(three))


