import UIKit
import PhotoEditorKit

class HomeViewController: UIViewController {
    //
    private let imagePickerController = UIImagePickerController()
    @IBOutlet private var pickerButton: UIButton!
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }
    
    @IBAction func pickImageAction(_ sender: UIButton?) {
        // Check if image picker is available on device
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = false
            imagePickerController.modalPresentationStyle = .fullScreen
            present(imagePickerController, animated: true)
        }
    }
}
// MARK:- Image Picker Delegate

extension HomeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let editor = BaseEditorViewController.instance(with: image, text: "Write your caption here.")
            navigationController?.pushViewController(editor, animated: true)
        }
        //
        imagePickerController.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePickerController.dismiss(animated: true)
    }
    
}
