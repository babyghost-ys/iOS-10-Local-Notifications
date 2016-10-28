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

    func scheLocalNotifications(seconds: TimeInterval, completion: (_ Success: Bool) -> ()){
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "Test Notification"
        notificationContent.subtitle = "This is the subtitle"
        notificationContent.body = "iOS 10 Notification Centre is rich"
        
        let notificationStarter = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "myNotif", content: notificationContent, trigger: notificationStarter)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

