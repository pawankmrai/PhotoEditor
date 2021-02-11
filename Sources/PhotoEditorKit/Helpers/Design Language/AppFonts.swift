//
//  AppFonts.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 07/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import Foundation
import UIKit

//
public typealias AppFonts = UIFont.CustomFonts
//
private typealias AppFrameworkFonts = PhotoEditorKitFontFamily.Lato


public extension UIFont {
    //
    struct CustomFonts {
        //
        public enum Styles: CaseIterable {
            //
            public typealias RawValue = UIFont
            //
            case normal
            case heavy
            case small
            //
            public init?(rawValue: RawValue) { return nil}
            //
            public var rawValue: RawValue {
                switch self {
                case .normal:
                    return AppFrameworkFonts.regular.font(size: 16)
                case .heavy:
                    return AppFrameworkFonts.bold.font(size: 16)
                case .small:
                    return AppFrameworkFonts.regular.font(size: 13)
                }
            }
        }
    }
}

