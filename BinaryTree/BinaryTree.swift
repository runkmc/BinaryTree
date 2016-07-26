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

extension Node: Equatable { }

func ==<T:Comparable>(lhs:Node<T>, rhs:Node<T>) -> Bool {
    if lhs.value != rhs.value {
        return false
    }
    return (lhs.left == rhs.left) && (lhs.right == rhs.right)
}

public final class BinaryTree<T: Comparable> {
    var head: Node<T>
    public var first: T {
        return head.value
    }
    private(set) var count: Int
    
    public init(initialValue:T) {
        self.head = Node(value: initialValue)
        self.count = 1
    }
    
    public func contains(value:T) -> Bool {
        return checkForValue(value: value, node: head)
    }
    
    public func add(value:T) {
        self.add(value:value, node:head)
        self.count += 1
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
    
    func min() -> T {
        return self.getMin(currentNode:self.head)
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
    
    private func getMin(currentNode:Node<T>) -> T {
        if let leftNode = currentNode.left {
            return getMin(currentNode: leftNode)
        } else {
            return currentNode.value
        }
    }
}

extension BinaryTree: Equatable { }

public func ==<T:Comparable>(lhs:BinaryTree<T>, rhs:BinaryTree<T>) -> Bool {
    return lhs.head == rhs.head
}
