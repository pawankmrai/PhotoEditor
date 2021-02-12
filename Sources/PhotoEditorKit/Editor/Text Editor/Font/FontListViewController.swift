import UIKit

class FontListViewController: UIViewController {
    //
    // MARK: IBOutlet
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Private
    private var fonts: [String] = UIFont.familyNames
    
    // MARK: Public
    public var fontUpdateDelegate: TextFont?
    public var actionDelegate: ActionDelegate?
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Cancel and Done Actions
    
    @IBAction func cancelTapped(_ sender: Any) {
        actionDelegate?.cancel()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        actionDelegate?.done()
    }
}

extension FontListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return fonts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FontListCollectionViewCell.reuseIdentifier,
                for: indexPath) as? FontListCollectionViewCell else {
            fatalError("Couldn't dequeue FontListCollectionViewCell")
        }
        //
        let font = fonts[indexPath.row]
        cell.font = font
        return cell
    }
    
}

extension FontListViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //
        let fontName = fonts[indexPath.row]
        fontUpdateDelegate?.font(name: fontName)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        //
        let cellWidth = 90
        let cellCount = fonts.count
        let cellSpacing = 0
        let collectionViewWidth = collectionView.bounds.width
        
        //
        let totalCellWidth = cellWidth * cellCount
        let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        let leftInset = max(0.0, (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2)
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
