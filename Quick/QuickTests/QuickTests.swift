//
//  QuickSpecs.swift
//  Quick
//
//  Created by Sid Raval on 10/7/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import Foundation
import Quick
import Nimble

class QuickSpecs: XCTestCase {
    func testQuick() {
        let testSuite: XCTestSuite = XCTestSuite.testSuiteForTestCaseClass(SimpleSpec.classForCoder()) as XCTestSuite
        testSuite.run()
    }
}

class SimpleSpec: QuickSpec {
    override func spec() {
        it("passes") {
            expect(true).to(beTruthy())
        }
        
        it("fails") {
            expect(false).to(beTruthy())
        }
    }
}