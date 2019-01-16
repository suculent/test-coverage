//
//  UIPasteboardTests.swift
//  UIPasteboardTests
//
//  Created by This is Terminator on 16/01/2019.
//  Copyright © 2019 Deleted. All rights reserved.
//

import XCTest
@testable import UIPasteboard

class UIPasteboardTests: XCTestCase {
    
    let vc = ViewController()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc.initSlack()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUntestableExample() {
        // This example test SHOULD NOT be repeatable... should send same string only once, but do not report this as test failure.
        vc.untestableExample(false)
    }
    
    func testReadPasteboard() {
        // This example test SHOULD NOT be repeatable... should send same string only once, but do not report this as test failure.
        vc.readPasteboard()
    }

    func testSendPasteboard() {
        // This example test SHOULD NOT be repeatable... should send same string only once, but do not report this as test failure.
        vc.sendSlack(string: "unique-string")
    }
    
    func testSendSlack() {
        // This example test SHOULD NOT be repeatable... should send same string only once, but do not report this as test failure.
        vc.sendPasteboard()
    }

    func testSendPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            vc.sendSlack(string: "unique-string")
        }
    }

}
