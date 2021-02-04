import UIKit
import PhotoEditorKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // Update whole app tint color
        window?.tintColor = .darkGray
        return true
    }
}
