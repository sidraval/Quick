//
//  MarkdownConverter+Error.swift
//  Shakedown
//
//  Created by Brian Ivan Gesiak on 6/27/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import Foundation

let MarkdownConverterErrorDomain = "MarkdownConverterErrorDomain"
enum MarkdownConverterErrorCode: Int {
    case ServiceUnavailable
}

extension MarkdownConverter {
    class func errorForCode(code: MarkdownConverterErrorCode) -> NSError {
        switch code {
        case .ServiceUnavailable:
            let description = NSLocalizedString("The online Markdown conversion service appears " +
                "to be unavailable. Please check your internet connection and try again.",
                comment: "")
            return NSError(domain: MarkdownConverterErrorDomain,
                code: MarkdownConverterErrorCode.ServiceUnavailable.toRaw(),
                userInfo: [NSLocalizedDescriptionKey: description])
        }
    }
}
