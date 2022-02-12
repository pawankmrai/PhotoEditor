//
//  Grid.swift
//  PhotoEditorKit
//
//  Created by Pawan on 12/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import Foundation

public enum Grid: CaseIterable {
    case oneToThree
    case twoToThree
    case threeToOne
    case threeToTwo
    case threeToThree
}

extension Grid {
    //
    var name: String {
        switch self {
		case .oneToThree:
			return "1X3"
		case .twoToThree:
			return "2X3"
		case .threeToOne:
			return "3X1"
		case .threeToTwo:
			return "3X2"
		case .threeToThree:
			return "3X3"
		}
    }
    //
    var image: String {
        switch self {
        case .oneToThree:
            return "Grid0"
        case .twoToThree:
            return "Grid1"
        case .threeToOne:
            return "Grid2"
        case .threeToTwo:
            return "Grid3"
        case .threeToThree:
            return "Grid4"
        }
    }
}
