import UIKit

class PhotoEditorViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Private
    private var controls: [Control] = [Control(type: .size),
                                       Control(type: .crop),
                                       Control(type: .rotate),
                                       Control(type: .exposure),
                                       Control(type: .brightness),
									   Control(type: .saturation),
									   Control(type: .contrast),
									   Control(type: .sharpness),
									   Control(type: .vignette),
									   Control(type: .color)]
    
    // MARK: Public
    public var editorDelegate: EditorDelegate?
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Control Action
    
}

extension PhotoEditorViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return controls.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HorizontalCollectionViewCell.reuseIdentifier,
                for: indexPath) as? HorizontalCollectionViewCell else {
            fatalError("Couldn't deque HorizontalCollectionViewCell")
        }
        //
        let control = controls[indexPath.row]
        cell.control = control
        return cell
    }
    
}

extension PhotoEditorViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let control = controls[indexPath.row]
        editorDelegate?.activate(control: control.type)
    }
}
