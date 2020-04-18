/*
    Singly Linked List
 */

public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
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

public struct LinkedList {
    public var head: ListNode?
    private var temp: ListNode? // Or call it tail
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            temp = head
        } else {
            temp?.next = ListNode(val)
            temp = temp?.next
        }
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)

node1.next = node2
node2.next = node3

print(node1) // 1 -> 2 -> 3

var list = LinkedList()
list.push(5)
list.push(10)
list.push(15)

print(list) //LinkedList(head: Optional(5 -> 10 -> 15), temp: Optional(15))


