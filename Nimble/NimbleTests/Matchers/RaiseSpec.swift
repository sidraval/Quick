//
//  RaiseSpec.swift
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/30/14.
//
//

import Quick
import Nimble

class RaiseSpec: QuickSpec {
    override func spec() {
        describe("raise()") {
            it("raises") {
                expect{true}.to.raise()
            }
        }
    }
}
