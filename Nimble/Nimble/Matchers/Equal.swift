//
//  Equal.swift
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/6/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import Foundation

class Equal: Matcher {
    let expected: NSObject?
    init(_ expected: NSObject?) {
        self.expected = expected
    }

    func failureMessage(actual: NSObject?) -> String {
        return "expected '\(expected)', got '\(actual)'"
    }

    func negativeFailureMessage(actual: NSObject?) -> String {
        return "expected subject not to equal '\(expected)'"
    }

    func match(actual: NSObject?) -> Bool {
        return actual == expected
    }
}

extension Prediction {
    @objc(nmb_equal:) func equal(expected: NSObject?) {
        evaluate(Equal(expected))
    }
}
