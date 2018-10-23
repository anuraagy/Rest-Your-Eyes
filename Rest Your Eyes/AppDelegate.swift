//
//  AppDelegate.swift
//  Rest Your Eyes
//
//  Created by Anuraag Yachamaneni on 10/23/18.
//  Copyright © 2018 Anuraag Yachamaneni. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var timer : Timer!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func notifyUser(sender: NSButton) {
        let path = "/usr/bin/osascript";
        let arguments = ["-e", "\'display notification \"Lorem ipsum dolor sit amet\" with title \"Title\"\'"]
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }
    
    @IBAction func stopNotifying(sender: NSButton) {
        if(timer != nil) {
            timer.invalidate()
            sender.isEnabled = false
        }
    }
    
    @IBAction func startNotifying(sender: NSButton) {
        if(timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(AppDelegate.sendMessage), userInfo: nil, repeats: true)
            sender.isEnabled = false
        }
    }

    @IBAction func notify(_ sender: NSButton) {
       
    }
    
    @objc func sendMessage() {
        let path = "/usr/bin/osascript";
        let notification = "display notification \"Look up and rest your eyes\" with title \"Twenty minutes have passed\""
        
        let arguments = ["-e", notification];
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }
    
}

