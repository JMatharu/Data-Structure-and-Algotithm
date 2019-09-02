import UIKit
import PlaygroundSupport

example(of: "Creating a Tree") {
    let beverage = TreeNode("Beverage")
    
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    
    beverage.add(hot)
    beverage.add(cold)
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("Hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

example(of: "depth-first traversal") {
    let tree = makeBeverageTree()
    tree.forEachDepthFirst { node in
        print(node.value)
    }
}

/*
 
 ---Example of depth-first traversal---
 Beverages
 Hot
 tea
 black
 green
 chai
 coffee
 cocoa
 cold
 soda
 ginger ale
 bitter lemon
 milk
 */

example(of: "level-order traversal") {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder { node in
        print(node.value)
    }
}

/*
 
 ---Example of level-order traversal---
 Beverages
 Hot
 cold
 tea
 coffee
 cocoa
 soda
 milk
 black
 green
 chai
 ginger ale
 bitter lemon
 */

example(of: "searching for a node") {
    let tree = makeBeverageTree()
    
    if let searchResult1 = tree.search("ginger ale") {
        print("Found node: \(searchResult1.value)")
    }
    if let searchResult2 = tree.search("WKD Blue") {
        print(searchResult2.value)
    } else {
        print("Couldn't find WKD Blue")
    }
}
