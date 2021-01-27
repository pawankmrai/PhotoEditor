import UIKit

public class BaseEditorViewController: UIViewController {
    // MARK: Private
    private var image: UIImage!
    private var currentControlsViewController: UIViewController?
    
    // MARK: IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imagePreviewView: UIView!
    @IBOutlet private weak var editPhotoButton: UIButton!
    @IBOutlet private weak var editTextButton: UIButton!
    @IBOutlet private weak var controlsView: UIView!
    
    // MARK: Public
    public static func instance(with image: UIImage) -> BaseEditorViewController {
        //
        let bundle = Bundle(for: BaseEditorViewController.self)
        let baseStoryboard = UIStoryboard(name: "BaseEditor", bundle: bundle)
        
        //
        guard let baseViewController = baseStoryboard.instantiateInitialViewController() as? BaseEditorViewController else {
            fatalError("Can't initialise base photo editor")
        }
        baseViewController.image = image
        return baseViewController
    }
    
    //
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        imageView.image = image
        
        // default photo editor
        editorAction(editPhotoButton)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        if let controlsSegue = segue as? ControlsSegue {
            //
            controlsSegue.currentViewController = currentControlsViewController
            controlsSegue.hostView = controlsView
            currentControlsViewController = controlsSegue.destination
        }
        //
        if segue.identifier == "Embed Text Editor" {
            let textEditorController = segue.destination as? TextEditorViewController
            textEditorController?.editorDelegate = self
        }
    }
    
    public override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    // MARK:- Control Action
    @IBAction func editorAction(_ sender: UIButton) {
        //
        if sender.isSelected {
            sender.isSelected = false
            //controlsView.isHidden = true
        } else {
            var segueIdentifier: String?
            switch sender {
            case editPhotoButton:
                segueIdentifier = "Embed Photo Editor"
            case editTextButton:
                segueIdentifier = "Embed Text Editor"
            default:
                break
            }
            //
            for button in [editPhotoButton, editTextButton] {
                button?.isSelected = sender == button
            }
            //
            //controlsView.isHidden = false
            performSegue(withIdentifier: segueIdentifier!, sender: self)
        }
    }
    
}

extension BaseEditorViewController: EditorDelegate {
    //
    func activate(control: ControlType) {
        //
        if control == .background {
            performSegue(withIdentifier: "Embed Background", sender: self)
        }
    }
    
}
