//
//  NotificationViewController.swift
//  contentExtend
//
//  Created by Peter Leung on 28/10/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {

    }

}
