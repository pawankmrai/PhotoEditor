import UIKit

public class AppEditorButton: UIButton {
    //
    public override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override var isSelected: Bool {
        //
        didSet {
            titleLabel?.font = isSelected ? AppFonts.Styles.heavy.rawValue : AppFonts.Styles.normal.rawValue
            titleLabel?.backgroundColor = isSelected ? AppColors.normal.color : AppColors.heavy.color
        }
    }
}
