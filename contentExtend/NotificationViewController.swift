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
        guard let attachedImage = notification.request.content.attachments.first else {
            return
        }
        
        //Access Image since the notifications is operating outside Sandbox
        if attachedImage.url.startAccessingSecurityScopedResource() {
            let imageData = try? Data.init(contentsOf: attachedImage.url)
            if let img = imageData {
                imageView.image = UIImage(data: img)
            }
        }
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        if response.actionIdentifier == "actionOne" {
            completion(.dismissAndForwardAction)
        } else {
            completion(.dismissAndForwardAction)
        }
    }
    

}
