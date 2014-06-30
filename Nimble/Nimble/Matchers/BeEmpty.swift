//
//  BeEmpty.swift
//  Quick
//
//  Created by Bryan Enders on 6/23/14.
//

import Foundation

class BeEmpty: Matcher {
    let _nilMessage = "expected subject not to be nil"

    func failureMessage(actual: NSObject?) -> String {
        return actual
            ? "expected subject to be empty, got '\(actual?.nmb_flatten())'"
            : _nilMessage
    }

    func negativeFailureMessage(actual: NSObject?) -> String {
        return actual
            ? "expected subject not to be empty"
            : _nilMessage
    }

    func match(actual: NSObject?) -> Bool {
        if let x = actual {
            switch x {
            case let array as NSArray:
                return array.count == 0
            case let set as NSSet:
                return set.count == 0
            case let string as NSString:
                return string.length == 0
            default:
                break
            }
        }

        return false
    }
}

extension Prediction {
    @objc(nmb_beEmpty) func beEmpty() {
        evaluate(BeEmpty())
    }
}
