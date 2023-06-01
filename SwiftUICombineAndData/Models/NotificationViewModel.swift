//
//  NotificationViewModel.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 01/06/23.
//

import Foundation
import SwiftUI
import UserNotifications
import FirebaseMessaging

class NotificationViewModel : ObservableObject {
    
    @Published var permission : UNAuthorizationStatus?
    @AppStorage("subscribedToAllNotifications") var subscribedToAllNotifications : Bool = false {
        didSet {
            if subscribedToAllNotifications {
                subscribedToAllTopics()
            } else {
                unsubscribedToAllTopics()
            }
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { permission in
            DispatchQueue.main.async {
                
                self.permission = permission.authorizationStatus
                
                if permission.authorizationStatus == .authorized {
                    UIApplication.shared.registerForRemoteNotifications()
                    
                    if self.subscribedToAllNotifications {
                        self.subscribedToAllTopics()
                    } else {
                        self.unsubscribedToAllTopics()
                    }
                    
                } else {
                    UIApplication.shared.unregisterForRemoteNotifications()
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    self.unsubscribedToAllTopics()
                }
            }
        }
    }
    
    private func subscribedToAllTopics() {
        guard permission == .authorized else {return}
        
        Messaging.messaging().subscribe(toTopic: "all") {error in
            if let error = error {
                print("Error while subscribing: ", error)
                return
            }
            print("Subscribed to notifications for all topics")
        }
    }
    
    private func unsubscribedToAllTopics() {
        guard permission == .authorized else {return}
        
        Messaging.messaging().unsubscribe(fromTopic: "all") {error in
            if let error = error {
                print("Error while unsubscribing: ", error)
                return
            }
            print("Unsubscribed from notifications for all topics")
        }
    }
    
}
