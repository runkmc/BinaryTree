import Foundation

indirect enum BinaryNode<T: Comparable> {
    case Node(BinaryNode<T>, T, BinaryNode<T>)
    case Empty
}

struct BinaryTree<T: Comparable> {
    public var first: T {
        switch head {
        case let .Node(_, value, _): return value
        default: fatalError()
        }
    }
    private var head:BinaryNode<T>

    init(initialValue:T) {
        self.head = .Node(.Empty, initialValue, .Empty)
    }
    
    public func contains(_ value:T) -> Bool {
        return self.checkForValue(value: value, node: head)
    }
    
    private func checkForValue(value:T, node:BinaryNode<T>) -> Bool {
        switch node {
        case .Node(let leftNode, let nodeValue, let rightNode):
            if value == nodeValue {
                return true
            } else {
                return checkForValue(value: value, node: leftNode) || checkForValue(value: value, node: rightNode)
            }
        case .Empty: return false
        }
    }
}
