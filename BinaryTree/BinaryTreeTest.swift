//
//  BinaryTreeTest.swift
//  BinaryTree
//
//  Created by Kevin McGladdery on 7/2/16.
//
//

import Foundation
import XCTest

class BinaryTreeTest: XCTestCase {
    func testTreeCreation() {
        let tree = BinaryTree(initialValue: 5)
        XCTAssertEqual(tree.first, 5)
    }
    
    func testContains() {
        let tree = BinaryTree(initialValue: 4)
        XCTAssertTrue(tree.contains(value: 4))
        XCTAssertFalse(tree.contains(value: 5))
    }
    
    func testAdd() {
        let tree = BinaryTree(initialValue: 10)
        tree.add(value:5)
        XCTAssertTrue(tree.contains(value: 5))
    }
    
    func testMax() {
        let tree = BinaryTree(initialValue: 10)
        tree.add(value: 11)
        tree.add(value: 29)
        tree.add(value: 4)
        tree.add(value: 5)
        tree.add(value: 199)
        tree.add(value: 189)
        tree.add(value: 2)
        XCTAssertEqual(tree.max(), 199)
    }
    
    func testMin() {
        let tree = BinaryTree(initialValue: 19)
        tree.add(value: 11)
        tree.add(value: 29)
        tree.add(value: 4)
        tree.add(value: 5)
        tree.add(value: 199)
        tree.add(value: 189)
        tree.add(value: 2)
        XCTAssertEqual(tree.min(), 2)
    }
    
    func testCount() {
        let tree = BinaryTree(initialValue: "what")
        XCTAssertEqual(tree.count, 1)
        tree.add(value: "do")
        tree.add(value: "you")
        XCTAssertEqual(tree.count, 3)
        tree.add(value: "think")
        XCTAssertEqual(tree.count, 4)
    }
}
