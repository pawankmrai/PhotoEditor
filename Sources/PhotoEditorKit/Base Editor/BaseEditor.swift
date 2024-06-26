import UIKit

public class BaseEditorViewController: UIViewController {
    // MARK: Private
    internal private(set) var image: UIImage!
    private var currentControlsViewController: UIViewController?
    
    // MARK: IBOutlets
    @IBOutlet internal 	var imageView: UIImageView!
    @IBOutlet private 	var imagePreviewView: UIView!
	//
    @IBOutlet private 	var editPhotoButton: UIButton!
	@IBOutlet private 	var editPhotoThumbView: UIView!
	//
	@IBOutlet private 	var editTextButton: UIButton!
	@IBOutlet private 	var editTextThumbView: UIView!
	
	//
    @IBOutlet private 	var controlsView: UIView!
    
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
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
		performSegue(withIdentifier: SegueType.photo.rawValue, sender: self)
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
		switch segue.identifier {
		case SegueType.photo.rawValue:
			let photoEditorController = segue.destination as? PhotoEditorViewController
            photoEditorController?.editorDelegate = self
		case SegueType.text.rawValue:
			let textEditorController = segue.destination as? TextEditorViewController
            textEditorController?.editorDelegate = self
		case SegueType.ci.rawValue:
			let exposureViewController = segue.destination as? CIFilterViewController
            exposureViewController?.filterUpdateDelegate = self
			exposureViewController?.controlType = sender as? ControlType
		default:
			break
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
				segueIdentifier = SegueType.photo.rawValue
            case editTextButton:
				segueIdentifier = SegueType.text.rawValue
            default:
                break
            }
            //
            for button in [editPhotoButton, editTextButton] {
                button?.isSelected = sender == button
            }
            //
            //controlsView.isHidden = false
			//
			editPhotoThumbView.alpha = sender == editPhotoButton ? 1.0 : 0.0
			editTextThumbView.alpha = sender == editTextButton ? 1.0 : 0.0
            performSegue(withIdentifier: segueIdentifier!, sender: self)
        }
    }
    
}

extension BaseEditorViewController: EditorDelegate {
    //
    func activate(control: ControlType) {
        //
		switch control {
		case .background:
			performSegue(withIdentifier: SegueType.background.rawValue, sender: control)
		case .exposure, .brightness, .contrast, .saturation, .sharpness, .vignette:
			performSegue(withIdentifier: SegueType.ci.rawValue, sender: control)
		default:
			break
		}
		
    }
    
}
