import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        return value as! String
    }
}

// Depth-first traversal
extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach { node in
            node.forEachDepthFirst(visit: visit)
        }
    }
}

//Level-order traversal
extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueArray<TreeNode>()
        children.forEach { node in
            _ = queue.enqueue(node)
        }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { node in
                _ = queue.enqueue(node)
            }
        }
    }
}

// Search
extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
