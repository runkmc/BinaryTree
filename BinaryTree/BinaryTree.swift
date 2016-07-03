import Foundation

indirect enum BinaryNode<T: Comparable> {
    case Node(BinaryNode<T>, T, BinaryNode<T>)
    case Empty
}

struct BinaryTree<T: Comparable> {
    var head:BinaryNode<T>
    var first: T {
        switch head {
        case let .Node(_, value, _): return value
        default: fatalError()
        }
    }
    
    init(initialValue:T) {
        self.head = .Node(.Empty, initialValue, .Empty)
    }
    
    
}
