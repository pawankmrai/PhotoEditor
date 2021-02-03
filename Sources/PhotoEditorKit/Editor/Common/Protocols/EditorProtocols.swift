import Foundation
import UIKit

protocol EditorDelegate {
    func activate(control: ControlType)
}

protocol ActionDelegate {
    func cancel()
    func done()
}

// MARK:- Photo Editor Protocols
protocol CIFilterDelegate {
    func exposure(with value: Double)
    func brightness(with value: Double)
    func saturation(with value: Double)
    func contrast(with value: Double)
    func sharpness(with value: Double)
    func vignette(with value: Double)
}


// MARK:- Text Editor Protocols

protocol TextLayerBackground {
    func layerBackground(active: Bool)
    func layerBackground(color: UIColor)
    func layerBackground(opacity: Double)
}

protocol TextShadow {
    func shawdow(color: UIColor)
    func shadow(opacity: Double)
}

protocol TextFont {
    func font(_ : UIFont)
    func font(size: Double)
}

protocol TextColor {
    func color(_: UIColor)
}

protocol TextFade {
    func fade(value: Double)
}

protocol TextLayerRotate {
    func layerRotate(angle: Double)
}
