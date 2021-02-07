import UIKit

class TextEditorViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Private
    private var controls: [Control] = [Control(type: .background),
                                       Control(type: .font),
                                       Control(type: .fontSize),
                                       Control(type: .fade),
                                       Control(type: .shadow),
                                       Control(type: .color),
                                       Control(type: .rotate)]
    
    // MARK: Public
    public var editorDelegate: EditorDelegate?
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TextEditorViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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

extension TextEditorViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let control = controls[indexPath.row]
        editorDelegate?.activate(control: control.type)
    }
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		//
		let cellWidth = 80
		let cellCount = controls.count
		let cellSpacing = 0
		let collectionViewWidth = collectionView.frame.width
		
		//
		let totalCellWidth = cellWidth * cellCount
		let totalSpacingWidth = cellSpacing * (cellCount - 1)
		
		let leftInset = max(0.0, (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2)
		let rightInset = leftInset
		
		return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
	}
}

