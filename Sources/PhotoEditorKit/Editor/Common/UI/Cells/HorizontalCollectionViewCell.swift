import UIKit

public class HorizontalCollectionViewCell: UICollectionViewCell {
    // MARK:- Public
    public class var reuseIdentifier: String {
        return "HorizontalCollectionViewCell"
    }
    
    public var control: Control! {
        didSet {
            configure()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet private var controlNameLabel: UILabel! {
        didSet {
            controlNameLabel?.font = AppFonts.Styles.small.rawValue
        }
    }
    @IBOutlet private var controlImageView: UIImageView!
    
    // MARK:- Init
    public override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configure() {
        //
        controlNameLabel?.text = control.name
        
        //
        let bundle = Bundle(for: HorizontalCollectionViewCell.self)
        controlImageView.image = UIImage(named: control.name, in: bundle, compatibleWith: nil)
    }
}
