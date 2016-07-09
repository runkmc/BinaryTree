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
        return checkForValue(value: value, node: currentNode.left) || checkForValue(value: value, node: currentNode.right)
    }
    
    private func add(value:T, node:Node<T>) {
        if value < node.value {
            if node.left == nil {
                node.left = Node(value: value)
            } else {
                self.add(value: value, node: node.left!)
            }
        }
        
        if value >= node.value {
            if node.right == nil {
                node.right = Node(value: value)
            } else {
                self.add(value: value, node: node.right!)
            }
        }
    }
}
