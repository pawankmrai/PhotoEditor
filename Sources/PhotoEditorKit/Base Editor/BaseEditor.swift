import UIKit
import PhotoEditorUI

public class BaseEditorViewController: UIViewController {
    // MARK: Internal / Private
    internal    var image: UIImage!
    internal    var text: String!
    private     var currentControlsViewController: UIViewController?
    
    // MARK: IBOutlets
    @IBOutlet internal  var imageView: JLStickerImageView!
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
    public static func instance(with image: UIImage, text: String) -> BaseEditorViewController {
        //
        let bundle = Bundle(for: BaseEditorViewController.self)
        let baseStoryboard = UIStoryboard(name: "BaseEditor", bundle: bundle)
        
        //
        guard let baseViewController = baseStoryboard.instantiateInitialViewController() as? BaseEditorViewController else {
            fatalError("Can't initialise base photo editor")
        }
        baseViewController.image = image
        baseViewController.text = text
        return baseViewController
    }
    
    //
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.addLabel(message: text)
        imageView.textColor = UIColor.white
        imageView.textAlpha = 1
      //  imageView.currentlyEditingLabel.closeView!.image = UIImage(named: "cancel")
        imageView.currentlyEditingLabel.rotateView?.image = PhotoEditorKitAsset.rotateOption.image
        imageView.currentlyEditingLabel.border?.strokeColor = UIColor.white.cgColor
        imageView.currentlyEditingLabel.labelTextView?.font = UIFont.systemFont(ofSize: 14.0)
        imageView.currentlyEditingLabel.labelTextView?.becomeFirstResponder()
        
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
			let ciFilterViewController = segue.destination as? CIFilterViewController
            ciFilterViewController?.filterUpdateDelegate = self
            ciFilterViewController?.actionDelegate = self
			ciFilterViewController?.controlType = sender as? ControlType
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
    
    /// Used to set content type on image view
    /// Aspect fill / Aspect fill
    /// - Parameter sender: Action Button
    @IBAction func changeImageViewSize(_ sender: UIButton) {
        //
        sender.isSelected = !sender.isSelected
        //
        imageView.contentMode = sender.isSelected ? .scaleAspectFit : .scaleAspectFill
    }
    
    /// Preview the final edited image before sharing
    /// - Parameter sender: Action Button
    @IBAction func previewAfterEditingDone(_ sender: UIButton) {
        
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

extension BaseEditorViewController: ActionDelegate {
    //
    func cancel() {
        imageView.image = image
        performSegue(withIdentifier: SegueType.photo.rawValue, sender: self)
    }
    
    func done() {
        image = imageView.image
        performSegue(withIdentifier: SegueType.photo.rawValue, sender: self)
    }
    
}
