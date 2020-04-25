public enum EdgeType {
    case directed
    case undirected
}

protocol Graph {
    associatedtype T
    
    typealias vertex = Vertex<T>
    typealias edge = Edge<T>
    
    func createVertex(data: T) -> vertex
    func egdes(from: Vertex<T>) -> [edge]?
    func addDirectedEdge(source: vertex, destination: vertex, weight: Double?)
    func addUnDirectedEdge(source: vertex, and destination: vertex, weight: Double?)
    func add(_ edge: EdgeType, from: vertex, to: vertex, weight: Double?)
    func weight(from source: vertex, to destination: vertex) -> Double?
}


struct Vertex<T> {
    let index: Int
    let data: T
    
}

extension Vertex: Hashable where T: Hashable {}

extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index): \(data)"
    }
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}


/*
 Adjacency Matrix Implementaion
 */

class AdjacencyMatrix<T>: Graph {
    var vertices: [Vertex<T>] = []
    var weights: [[Double?]] = []
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        let newRow = [Double?](repeating: nil, count: weights.count + 1)
        weights.append(newRow)
        return vertex
    }
    
    func egdes(from source: Vertex<T>) -> [Edge<T>]? {
        var edges = [Edge<T>]()
        
        for columnIndex in 0..<weights.count {
            if let weight = weights[source.index][columnIndex] {
                let edge = Edge(source: source, destination: vertices[columnIndex], weight: weight)
                edges.append(edge)
            }
        }
        
        return edges
    }
    
    func addDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        weights[source.index][destination.index] = weight
    }
    
    func addUnDirectedEdge(source: Vertex<T>, and destination: Vertex<T>, weight: Double?) {
        weights[source.index][destination.index] = weight
    }
    
    func add(_ edge: EdgeType, from: vertex, to: vertex, weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(source: from, destination: to, weight: weight)
        case .undirected:
            addUnDirectedEdge(source: from, and: to, weight: weight)
        }
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return weights[source.index][destination.index]
    }
}

extension AdjacencyMatrix: CustomStringConvertible {
    public var description: String {
        // 1
        let verticesDescription = vertices.map { "\($0)" }
            .joined(separator: "\n")
        // 2
        var grid: [String] = []
        for i in 0..<weights.count {
            var row = ""
            for j in 0..<weights.count {
                if let value = weights[i][j] {
                    row += "\(value)\t"
                } else {
                    row += "ø\t\t"
                }
            }
            grid.append(row)
        }
        let edgesDescription = grid.joined(separator: "\n")
        // 3
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}

let graph = AdjacencyMatrix<String>()
let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washingtonDC = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")
graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

print(graph)
graph.egdes(from: singapore)?.forEach({ edge in
    print(edge.source.data, "->", edge.destination.data)
})
