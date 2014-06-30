//
//  Contain.swift
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/7/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import Foundation

class Contain: Matcher {
    let expected: NSObject?
    init(_ expected: NSObject?) {
        self.expected = expected
    }

    func failureMessage(subject: NSObject?) -> String {
        return "expected '\(subject?.nmb_flatten())' to contain '\(expected)'"
    }

    func negativeFailureMessage(subject: NSObject?) -> String {
        return "expected '\(subject?.nmb_flatten())' not to contain '\(expected)'"
    }

    func match(subject: NSObject?) -> Bool {
        if let x = subject {
            switch x {
            case let array as NSArray:
                return array.containsObject(expected)
            case let set as NSSet:
                return set.containsObject(expected)
            case let string as NSString:
                if let substring = expected as? NSString {
                    return string.rangeOfString(substring).location != NSNotFound
                }
            default:
                break
            }
        }

        return false
    }
}

extension Prediction {
    @objc(nmb_contain:) func contain(expected: NSObject?) {
        evaluate(Contain(expected))
    }
}
