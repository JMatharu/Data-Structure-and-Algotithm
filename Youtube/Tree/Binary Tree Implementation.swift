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

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let head = TreeNode(0, node1, node2)


head.val // 0
head.left?.val // 1
head.right?.val // 2

