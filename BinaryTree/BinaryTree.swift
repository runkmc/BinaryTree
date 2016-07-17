import Foundation

final class Node<T: Comparable> {
    let value: T
    var left: Node?
    var right: Node?
    
    init(value:T) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

public final class BinaryTree<T: Comparable> {
    var head: Node<T>
    public var first: T {
        return head.value
    }
    
    public init(initialValue:T) {
        self.head = Node(value: initialValue)
    }
    
    public func contains(value:T) -> Bool {
        return checkForValue(value: value, node: head)
    }
    
    public func add(value:T) {
        self.add(value:value, node:head)
    }
    
    private func checkForValue(value:T, node:Node<T>?) -> Bool {
        guard let currentNode = node else { return false }
        
        if currentNode.value == value { return true }
        
        if currentNode.value > value {
            return checkForValue(value: value, node: currentNode.left)
        }
        
        if currentNode.value < value {
            return checkForValue(value: value, node: currentNode.right)
        }
        
        return false
    }
    
    func max() -> T {
        return self.getMax(currentNode:self.head)
    }
    
    private func add(value:T, node:Node<T>) {
        if value < node.value {
            if let leftNode = node.left {
                self.add(value: value, node: leftNode)
            } else {
                node.left = Node(value: value)
            }
        }
        
        if value >= node.value {
            if let rightNode = node.right {
                self.add(value: value, node: rightNode)
            } else {
                node.right = Node(value: value)
            }
        }
    }
    
    private func getMax(currentNode:Node<T>) -> T {
        if let rightNode = currentNode.right {
            return getMax(currentNode: rightNode)
        } else {
            return currentNode.value
        }
    }
}
