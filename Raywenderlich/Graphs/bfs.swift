extension Graph where Element: Hashable {
    
  func bfs(from source: Vertex<Element>) -> [Vertex<Element>] {
    var queue = QueueStack<Vertex<Element>>()
    var enqueued: Set<Vertex<Element>> = []
    var visited: [Vertex<Element>] = []

    queue.enqueue(source)
    enqueued.insert(source)
    
    // Recursive implementation
    searchNeighbours(on: &queue,
                     on: &enqueued,
                     visited: &visited)

    return visited
  }
    
    func searchNeighbours(on queue: inout QueueStack<Vertex<Element>>,
                          on enqueued: inout Set<Vertex<Element>>,
                          visited: inout [Vertex<Element>]) {

        guard let vertex = queue.dequeue() else {
            return
        }
        visited.append(vertex)
        
        let neighbours = edges(from: vertex)
        neighbours.forEach { neighbour in
            if !enqueued.contains(neighbour.destination) {
                queue.enqueue(neighbour.destination)
                enqueued.insert(neighbour.destination)
            }
        }
        searchNeighbours(on: &queue,
                         on: &enqueued,
                         visited: &visited)
    }
}
