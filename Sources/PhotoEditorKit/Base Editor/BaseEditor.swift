import UIKit
import PhotoEditorUI

public class BaseEditorViewController: UIViewController {
    // MARK: Internal / Private
    internal    var image: UIImage!
    internal    var text: String!
    private     var currentControlsViewController: UIViewController?
    private     var segueIdentifier: String = SegueType.photo.rawValue // Hold the last segue performed
    
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
        //imageView.currentlyEditingLabel.closeView!.image = UIImage(named: "cancel")
        imageView.currentlyEditingLabel.rotateView?.image = PhotoEditorKitAsset.rotateOption.image
        imageView.currentlyEditingLabel.border?.strokeColor = UIColor.white.cgColor
        imageView.currentlyEditingLabel.labelTextView?.font = UIFont.systemFont(ofSize: 14.0)
        imageView.currentlyEditingLabel.labelTextView?.becomeFirstResponder()
        
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
		switch segue.identifier {
		case SegueType.photo.rawValue:
			let photoEditorController = segue.destination as? PhotoEditorViewController
            photoEditorController?.editorDelegate = self
		case SegueType.text.rawValue:
			let textEditorController = segue.destination as? TextEditorViewController
            textEditorController?.editorDelegate = self
		case SegueType.slider.rawValue:
			let sliderViewController = segue.destination as? SliderViewController
            sliderViewController?.filterUpdateDelegate = self
            sliderViewController?.actionDelegate = self
            sliderViewController?.textFontUpdateDelegate = self
            sliderViewController?.textFadeDelegate = self
            sliderViewController?.textLayerRotateDelegate = self
			sliderViewController?.controlType = sender as? ControlType
        case SegueType.fontList.rawValue:
            let fontListViewController = segue.destination as? FontListViewController
            fontListViewController?.fontUpdateDelegate = self
            fontListViewController?.actionDelegate = self
        case SegueType.textShadow.rawValue:
            let shadowViewController = segue.destination as? ShadowViewController
            shadowViewController?.actionDelegate = self
        case SegueType.background.rawValue:
            let backgroundViewController = segue.destination as? BackgroundViewController
            backgroundViewController?.actionDelegate = self
        case SegueType.colorList.rawValue:
            let colorListController = segue.destination as? ColorListViewController
            colorListController?.actionDelegate = self
            colorListController?.colorUpdateDelegate = self
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
        } else {
            //
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
			editPhotoThumbView.alpha = sender == editPhotoButton ? 1.0 : 0.0
			editTextThumbView.alpha = sender == editTextButton ? 1.0 : 0.0
            performSegue(withIdentifier: segueIdentifier, sender: self)
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
        case .exposure, .brightness, .contrast, .saturation, .sharpness, .vignette, .fontSize, .fade, .rotate:
			performSegue(withIdentifier: SegueType.slider.rawValue, sender: control)
        case .font:
            performSegue(withIdentifier: SegueType.fontList.rawValue, sender: control)
        case .shadow:
            performSegue(withIdentifier: SegueType.textShadow.rawValue, sender: control)
        case .color:
            performSegue(withIdentifier: SegueType.colorList.rawValue, sender: control)
		default:
			break
		}
		
    }
    
}

extension BaseEditorViewController: ActionDelegate {
    //
    func cancel() {
        imageView.image = image
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    func done() {
        image = imageView.image
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
}
