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

protocol PhotoSize {
    func size(with ratio: AspectRatio)
}

protocol CollageShape {
    func create(collage shape: Collage)
}

protocol GridShape {
    func create(grid shape: Grid)
}

// MARK:- Text Editor Protocols

protocol TextLayerBackground {
    func layerBackground(active: Bool)
    func layerBackgroundColor(with button: UIButton)
    func layerBackgroundOpacity()
}

protocol TextShadow {
    func color(with button: UIButton)
    func opacity()
    func shadow(value: Float)
}

protocol TextFont {
    func font(name : String)
    func font(size: Int)
}

protocol TextColor {
    func color(_: UIColor)
}

protocol TextFade {
    func fade(value: Double)
}

protocol TextLayerRotate {
    func layerRotate(angle: Int)
}
