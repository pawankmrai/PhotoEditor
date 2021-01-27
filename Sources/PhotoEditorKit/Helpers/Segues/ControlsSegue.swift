import UIKit

class ControlsSegue: UIStoryboardSegue {
    //
    var hostView: UIView?
    var currentViewController: UIViewController?
    
    //
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    //
    override func perform() {
        //
        if let currentControllersViewController = currentViewController {
            currentControllersViewController.willMove(toParent: nil)
            currentControllersViewController.removeFromParent()
            currentControllersViewController.view.removeFromSuperview()
        }
        //
        source.addChild(destination)
        hostView!.addSubview(destination.view)
        destination.view.frame = hostView!.bounds
        destination.didMove(toParent: source)
    }
}
