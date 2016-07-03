import Foundation

indirect enum BinaryNode<T> {
    case Node(BinaryNode<T>, T, BinaryNode<T>)
    case Empty
}
