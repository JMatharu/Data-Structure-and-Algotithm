public class TreeNode {
     public var val: Int?
     public var left: TreeNode?
     public var right: TreeNode?
     public var root: TreeNode?
     public init() { self.val = nil; self.left = nil; self.right = nil; self.root = nil }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; self.root = nil }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
         self.root = nil
     }
}

// Insert in a BST
extension TreeNode {
    
    func insertInBST(_ val: Int) {
        root = insert(val: val, root: root)
    }
    
    private func insert(val: Int, root: TreeNode?) -> TreeNode {
        
        guard let r = root else { return TreeNode(val) }
            
        if val < r.val! {
            // Left
            r.left = insert(val: val, root: root?.left)
        } else if val > r.val! {
            // Right
            r.right = insert(val: val, root: root?.right)
        }
        return r
    }
}

/*
 In Order Traversal - Root Left Right
 */

func inOrderTraversalOf(_ root: TreeNode?) -> [Int?] {
    guard let r = root else { return [Int]() }
    
    return inOrderTraversalOf(r.left) + [r.val] + inOrderTraversalOf(r.right)
}

let tree1 = TreeNode()
for value in [11,6,8,19,4, 10, 5, 17, 43, 49, 31] {
    tree1.insertInBST(value)
}

let tree2 = TreeNode()
for value in [50, 30, 20, 40, 70, 60, 80] {
    tree2.insertInBST(value)
}

inOrderTraversalOf(tree1.root) // [4, 5, 6, 8, 10, 11, 17, 19, 31, 43, 49]
inOrderTraversalOf(tree2.root) // [20, 30, 40, 50, 60, 70, 80]
