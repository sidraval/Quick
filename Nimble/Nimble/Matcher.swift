//
//  Matcher.swift
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/6/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import Foundation

@objc protocol Matcher {
    func failureMessage(actual: NSObject?) -> String
    func negativeFailureMessage(actual: NSObject?) -> String
    func match(actual: NSObject?) -> Bool
}
