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
        return "\(val) <- " + String(describing: next)
    }
}

struct Queue<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    
    private var frontIndex = -1
    private var rearIndex = -1
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ value: T) {
        let newNode = ListNode(value)
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func deque() -> T? {
        guard !isEmpty else {
            print("All elements of queue are being removed")
            return nil
        }
        
        let temp = head
        head = temp?.next
        return temp?.val
    }
    
    mutating func peak() -> T? {
        guard !isEmpty else {
            print("All elements of queue are being removed")
            return nil
        }
        
        return head?.val
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.head //1 <- 2 <- 3
queue.deque() // 1
queue.deque() // 2
queue.deque() // 3
queue.deque() // All elements of queue are being removed
queue.enqueue(11) // 11
queue.enqueue(12) //11 <- 12
queue.enqueue(13) //11 <- 12 <- 13
queue.peak() //11
queue.head //11 <- 12 <- 13
