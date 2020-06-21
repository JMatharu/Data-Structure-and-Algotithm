public class TreeNode<T> {
     public var val: T
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: T) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: T, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

let node7 = TreeNode(7)
let node8 = TreeNode(8)
let node5 = TreeNode(5, node7, node8)
let node1 = TreeNode(1)
let node10 = TreeNode(10, nil, node1)
let treeRootNode = TreeNode(4, node5, node10)

/*
 In order Traversal - Left Root Right
 */

func inOrderTraversalOf<T>(_ root: TreeNode<T>?) -> [T] {
    guard let r = root else { return [T]() }
    
    return inOrderTraversalOf(r.left) + [r.val] + inOrderTraversalOf(r.right)
}

inOrderTraversalOf(treeRootNode) //[7, 5, 8, 4, 10, 1]

/*
 Pre Order Traversal - Root Left Right
 */

func preOrderTraversalOf<T>(_ root: TreeNode<T>?) -> [T] {
    guard let r = root else { return [T]() }
    
    return [r.val] + preOrderTraversalOf(r.left) + preOrderTraversalOf(r.right)
}

preOrderTraversalOf(treeRootNode) //[4, 5, 7, 8, 10, 1]

/*
 Post Order Traversal = Left Right Root
 */

func postOrderTraversalOf<T>(_ root: TreeNode<T>?) -> [T] {
    guard let r = root else { return [T]() }
    
    return postOrderTraversalOf(r.left) + postOrderTraversalOf(r.right) + [r.val]
}

postOrderTraversalOf(treeRootNode) //[7, 8, 5, 1, 10, 4]
