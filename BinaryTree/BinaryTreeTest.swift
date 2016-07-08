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
        XCTAssertTrue(tree.contains(4))
        XCTAssertFalse(tree.contains(5))
    }
}
