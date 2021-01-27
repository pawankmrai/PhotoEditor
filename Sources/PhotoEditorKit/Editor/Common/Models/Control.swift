import Foundation
import UIKit

public enum ControlType {
    case size
    case crop
    case rotate
    case exposure
    case brightness
    case saturation
    case contrast
    case sharpness
    case vignette
    case color
    case background
    case font
    case shadow
    case fade
}

extension ControlType {
    //
    public var name: String {
        switch self {
        case .size:
            return "Size"
        case .crop:
            return "Crop"
        case .rotate:
            return "Rotate"
        case .exposure:
            return "Exposure"
        case .brightness:
            return "Brightness"
        case .saturation:
            return "Saturation"
        case .contrast:
            return "Contrast"
        case .sharpness:
            return "Sharpness"
        case .vignette:
            return "Vignette"
        case .color:
            return "Color"
        case .background:
            return "Background"
        case .font:
            return "Font"
        case .shadow:
            return "Shadow"
        case .fade:
            return "Fade"
        }
    }
    
}

public struct Control {
    //
    public let name: String
    public let type: ControlType
    //
    internal init(name: String, type: ControlType) {
        self.name = name
        self.type = type
    }
    
    init(type: ControlType) {
        self.name = type.name
        self.type = type
    }
}
