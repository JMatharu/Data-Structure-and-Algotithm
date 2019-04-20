// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.


example(of: "Creating a linking node") {
    
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1)
}

example(of: "Creating a linked list Push") {
    var list = LinkedList<Int>()
    list.push(1)
    list.push(2)
    list.push(3)
    print(list)
}

example(of: "Creating a linked list Append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    print(list)
}


example(of: "Inserting at particular Index") {
    var list = LinkedList<Int>()
    list.push(1)
    list.push(2)
    list.push(3)
    
    print("Before inserting: \(list)")
    
    var middleNode = list.node(at: 1)!
    
    for _ in stride(from: 0, to: 4, by: 1) {
        middleNode = list.insert(value: -1, after: middleNode)
    }
    
    print("After inserting: \(list)")
}


// Result
/*
 ---Example of Creating a linking node---
 1 -> 2 -> 3
 
 ---Example of Creating a linked list Push---
 3 -> 2 -> 1
 
 ---Example of Creating a linked list Append---
 1 -> 2 -> 3
 
 ---Example of Inserting at particular Index---
 Before inserting: 3 -> 2 -> 1
 After inserting: 3 -> 2 -> -1 -> -1 -> -1 -> -1 -> 1   
 */
