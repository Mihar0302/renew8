import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        super.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
        completionHandler();

    }

    override func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        guard let userInfo = notification.request.content.userInfo as? [String : Any] else { return }
        super.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
        completionHandler([.sound,.alert])
    }
}
