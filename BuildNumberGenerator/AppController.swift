//
//  AppController.swift
//  BuildNumberGenerator
//
//  Created by Peter Huber on 2020-12-07.
//

import Cocoa

class AppController: NSObject {

    @IBOutlet weak var buildNumber: NSTextField!
    
    var currentBuildNumber:CFTimeInterval = 0
    
    override func awakeFromNib() {
        
        handleGenerateNewNumber(self)
    }
    
    @IBAction func handleCopyToClipboard(_ sender: Any) {
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(self.buildNumber.stringValue, forType: .string)
    }
    
    @IBAction func handleGenerateNewNumber(_ sender: Any) {
        
        self.currentBuildNumber = Date.timeIntervalSinceReferenceDate
        
        let intBuildNumber = Int(floor(self.currentBuildNumber))
        
        print(intBuildNumber)
        
        self.buildNumber.stringValue = String(intBuildNumber, radix: 16).uppercased()
        
        self.buildNumber.isHidden = false
    }
}
