//
//  ViewController.swift
//  Shakedown
//
//  Created by Brian Ivan Gesiak on 6/26/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import UIKit

let ShowHTMLViewControllerSegueIdentifier = "showHTMLViewController"

class MarkdownViewController: UIViewController {
    @IBOutlet var textView: UITextView?
    var HTML: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Markdown", comment: "")
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == ShowHTMLViewControllerSegueIdentifier {
            let htmlViewController = segue.destinationViewController as HTMLViewController
            htmlViewController.HTML = self.HTML
        }
    }

    @IBAction func onConvertBarButtonItemTap(sender: UIBarButtonItem) {
        let converter = MarkdownConverter()
        let application = UIApplication.sharedApplication()

        application.networkActivityIndicatorVisible = true
        converter.convert(textView!.text, queue: NSOperationQueue.mainQueue(),
            success: { (HTML: String) -> () in
                application.networkActivityIndicatorVisible = false
                self.HTML = HTML
                self.performSegueWithIdentifier(ShowHTMLViewControllerSegueIdentifier, sender: nil)
            },
            failure: { (error: NSError) -> () in
                application.networkActivityIndicatorVisible = false
                self._presentAlertControllerForError(error)
            })
    }
    
    func _presentAlertControllerForError(error: NSError) {
        let alertController = UIAlertController(title: NSLocalizedString("Error", comment: ""),
            message: error.localizedDescription,
            preferredStyle: UIAlertControllerStyle.Alert)

        let dismissAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""),
            style: UIAlertActionStyle.Default,
            handler: { (action: UIAlertAction!) -> Void in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
        alertController.addAction(dismissAction)

        self.presentViewController(alertController, animated: true, completion:nil)
    }
}

