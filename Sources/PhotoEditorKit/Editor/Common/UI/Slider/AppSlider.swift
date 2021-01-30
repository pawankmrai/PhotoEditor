import UIKit

class AppSlider: UISlider {
	// MARK:- Properties
	@IBInspectable var trackHeight: CGFloat = 2
	@IBInspectable var thumbRadious: CGFloat  = 15
	//
	private lazy var thumbView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.borderWidth = 1.5
		view.layer.borderColor = UIColor.black.cgColor
		return view
	}()
	//
	override func awakeFromNib() {
		super.awakeFromNib()
		//
		let thumb = thumbImage(radius: thumbRadious)
		setThumbImage(thumb, for: .normal)
	}
	
	private func thumbImage(radius: CGFloat) -> UIImage {
		// Set proper frame
        // y: radius / 2 will correctly offset the thumb
        thumbView.frame = CGRect(x: 0, y: radius / 2, width: radius, height: radius)
        thumbView.layer.cornerRadius = radius / 2

        // Convert thumbView to UIImage
        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
	}
	//
	override func trackRect(forBounds bounds: CGRect) -> CGRect {
		let point = CGPoint(x: bounds.minX, y: bounds.midY)
		return CGRect(origin: point, size: CGSize(width: bounds.width, height: trackHeight))
	}
}
