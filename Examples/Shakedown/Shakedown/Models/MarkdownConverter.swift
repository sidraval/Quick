//
//  MarkdownConverter.swift
//  Shakedown
//
//  Created by Brian Ivan Gesiak on 6/26/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import Foundation

class MarkdownConverter {
    let endpoint: String
    init(endpoint: String = "https://api.github.com/markdown") {
        self.endpoint = endpoint
    }
    
    func convert(text: String, queue: NSOperationQueue, success: ((HTML: String) -> ())?, failure: ((error: NSError) -> ())?) {
        var request = NSMutableURLRequest(URL: NSURL(string: endpoint))
        request.HTTPMethod = "POST"
        request.HTTPBody = "{\"text\":\"\(_escape(text))\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            let httpResponse = response as NSHTTPURLResponse
            
            if error {
                failure?(error: error)
            } else if httpResponse.statusCode != 200 {
                let code = MarkdownConverterErrorCode.ServiceUnavailable
                failure?(error: MarkdownConverter.errorForCode(code))
            } else {
                let HTMLBody = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
                success?(HTML: self._HTMLForBody(HTMLBody))
            }
        })
    }
    
    func _escape(text: String) -> String {
        let quoteEscaped = text.stringByReplacingOccurrencesOfString("\"", withString: "\\\"")
        return quoteEscaped.stringByReplacingOccurrencesOfString("\n", withString: "\\n")
    }
    
    func _HTMLForBody(HTMLBody: String) -> String {
        return "<!DOCTYPE html><html><head><link href=\"github-markdown.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\"></head><body><div class=\"markdown-body\">\(HTMLBody)</div></body></html>"
    }
}
