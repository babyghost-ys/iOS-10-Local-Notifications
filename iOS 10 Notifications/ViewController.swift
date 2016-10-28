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
        schLocalNotifications(seconds: 3, completion: {succ in
            if succ {
                print("done")
            } else {
                print("failed")
            }
        })
    }

    func schLocalNotifications(seconds: TimeInterval, completion: (_ Success: Bool) -> ()){
        
        //For gif Image
        let gifImage = "aaron"
        guard let imageURL = Bundle.main.url(forResource: gifImage, withExtension: "gif") else {
            //errored
            completion(false)
            return
        }
        
        var attachImage:UNNotificationAttachment
        attachImage = try! UNNotificationAttachment(identifier: "myNotif", url: imageURL, options: .none)
        
        
        //Original Notification
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "Test Notification"
        notificationContent.subtitle = "This is the subtitle"
        notificationContent.body = "iOS 10 Notification Centre is rich"
        notificationContent.attachments = [attachImage]
        
        //changed Category - Using Custom Notification Centre
        notificationContent.categoryIdentifier = "myNotificationCategory"
        
        let notificationStarter = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "myNotif", content: notificationContent, trigger: notificationStarter)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

