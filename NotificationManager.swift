import UserNotifications

class NotificationManager {
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                print("✅ Permission accordée !")
            }
        }
    }

    func sendEncouragement() {
        let content = UNMutableNotificationContent()
        content.title = "💪 Continue tes efforts !"
        content.body = "Essaie de retarder ta prochaine cigarette. Tu es plus fort que tu ne le crois !"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * 60, repeats: false) // Notification dans 1h
        let request = UNNotificationRequest(identifier: "Motivation", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
