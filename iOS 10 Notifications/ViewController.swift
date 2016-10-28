//
//  ViewController.swift
//  iOS 10 Notifications
//
//  Created by Peter Leung on 28/10/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(got, error) in
            
            if got {
                print("Access granted")
            } else {
                
            }
        })
    }
    
    @IBAction func setLocalNotifications(_ sender: Any) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

