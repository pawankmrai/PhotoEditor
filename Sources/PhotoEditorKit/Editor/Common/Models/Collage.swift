//
//  Collage.swift
//  PhotoEditorKit
//
//  Created by Pawan on 12/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import Foundation

public enum Collage: CaseIterable {
    case normal
    case fourSquare
    case twoVertical
    case twoSquareOneHorizontal
    case twoSquareOneVertical
    case oneVerticalTwoSquare
    case oneHorizontalThreeSquare
}

extension Collage {
    //
    var name: String {
        switch self {
        case .normal:
            return "Collage0"
        case .fourSquare:
            return "Collage1"
        case .twoVertical:
            return "Collage2"
        case .twoSquareOneHorizontal:
            return "Collage3"
        case .twoSquareOneVertical:
            return "Collage4"
        case .oneVerticalTwoSquare:
            return "Collage5"
        case .oneHorizontalThreeSquare:
            return "Collage6"
        }
    }
}
