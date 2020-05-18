struct Heap<Element: Comparable> {
    
    var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element]) {
        self.sort = sort
        self.elements = elements
 
        if !isEmpty {
            for i in stride(from: elements.count / 2, to: 0, by: -1) {
                shiftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    var peek: Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (index * 2) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (index * 2) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // O(log n)
    mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1) // O(1)
        
        defer {
            shiftDown(from: 0)
        }
        
        return elements.removeLast()
    }
    
    //O(log n)
    mutating private func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    //O(log n)
    mutating func insert(_ element: Element) {
        elements.append(element) // O(1)
        shiftUp(from: count - 1)
    }
    
    //O(log n)
    mutating private func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    //O(log n)
    mutating func remove(at index: Int) -> Element? {
        guard index < count else { return nil }
        
        if index == count -  1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, count - 1)
            defer {
                shiftDown(from: index)
                shiftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    // O(n)
    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count { return nil }
        if sort(element, elements[i]) { return nil }
        if element == elements[i] { return i }
        if let leftIndex = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) { return leftIndex }
        if let rightIndex = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) { return rightIndex }
        return nil
    }
}


var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])

while !heap.isEmpty {
    print(heap.remove()!)
}
