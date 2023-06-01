//
//  NotificationRow.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 01/06/23.
//

import SwiftUI

struct NotificationRow: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var notificationVM = NotificationViewModel()
    
    var body: some View {
        Group {
            if notificationVM.permission == .authorized {
                Toggle(isOn: $notificationVM.subscribedToAllNotifications) {
                    HStack(spacing: 12) {
                        GradientIcon(icon: "bell.fill")
                        VStack(alignment: .leading) {
                            Text("Notify me of new content")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Max once a week")
                                .font(.caption2)
                                .opacity(0.3)
                        }
                    }
                }
                .tint(Color(#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)))
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Notifications are disabled")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("We can't notify you when new content is available")
                        .font(.caption2)
                        .opacity(0.7)
                    
                    Link(destination: URL(string: UIApplication.openSettingsURLString)!) {
                        Text("Open Settings")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onAppear {
            notificationVM.getNotificationSettings()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                notificationVM.getNotificationSettings()
            }
        }
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow()
    }
}
