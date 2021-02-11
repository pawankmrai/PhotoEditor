//
//  AspectRatio.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 10/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import Foundation
import UIKit

public enum AspectRatio: CaseIterable {
    case square
    case portrait
    case three_to_four
    case nine_to_sixteen
    case circle
}

extension AspectRatio {
    //
    public var value: CGFloat {
        switch self {
        case .square:
            return 1/1
        case .portrait:
            return 3/2
        case .three_to_four:
            return 4/3
        case .nine_to_sixteen:
            return 16/9
        case .circle:
            return 1
        }
    }
    //
    public var name: String {
        switch self {
        case .square:
            return "Instagram \n(Square)"
        case .portrait:
            return "Instagram \n(portrait)"
        case .three_to_four:
            return "3:4"
        case .nine_to_sixteen:
            return "9:16"
        case .circle:
            return "Circle"
        }
    }
}
