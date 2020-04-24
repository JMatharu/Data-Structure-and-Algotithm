struct Queue<T>: CustomStringConvertible {
    
    var elements = [T?]()
    private var frontIndex = -1
    private var rearIndex = -1
    
    var isEmpty: Bool {
        return elements.count == 0
    }
    
    var description: String {
        var temp = ""
        for index in 0..<elements.count {
            if let element = elements[index] {
                temp += "\(element)"
            }
            if index < elements.count - 1 {
                temp += " <- "
            }
        }
        return temp
    }
    
    mutating func enqueue(_ value: T) {
        guard !isEmpty else {
            elements += [value]
            rearIndex = 0
            frontIndex = 0
            return
        }
        
        elements += [value]
        rearIndex += 1
    }
    
    mutating func deque() -> T? {
        guard !isEmpty else {
            print("All elements of queue are being removed")
            return nil
        }
        
        guard frontIndex < rearIndex else {
            return elements.removeFirst()
        }
        
        let element = elements.removeFirst()
        
        frontIndex += 1
        
        return element
    }
    
    mutating func peak() -> T? {
        guard !isEmpty else {
            print("All elements of queue are being removed")
            return nil
        }
        
        return elements[frontIndex]
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue //1 <- 2 <- 3
queue.deque() // 1
queue.deque() // 2
queue.deque() // 3
queue.deque() // All elements of queue are being removed
queue.enqueue(11) // 11
queue.enqueue(12) //11 <- 12
queue.enqueue(13) //11 <- 12 <- 13
queue.peak() //11
queue //11 <- 12 <- 13


