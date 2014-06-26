//
//  HTMLViewController.swift
//  Shakedown
//
//  Created by Brian Ivan Gesiak on 6/26/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import UIKit

class HTMLViewController: UIViewController {
    @IBOutlet var webView: UIWebView?
    var HTML: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("HTML", comment: "")

        if let HTMLString = HTML {
            webView!.loadHTMLString(HTMLString, baseURL: NSBundle.mainBundle().bundleURL)
        } else {
            NSException(name: NSInternalInconsistencyException,
                reason: "\(self.classForCoder) does not have any HTML to display",
                userInfo: nil).raise()
        }
    }
}
