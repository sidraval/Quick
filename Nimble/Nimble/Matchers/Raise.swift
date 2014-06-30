//
//  Raise.swift
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/30/14.
//
//

extension ClosureExpectation {
    @objc(nmb_raise) func raise() {
        let r = NMBRaise()
        evaluate(BeTrue())
    }
}
