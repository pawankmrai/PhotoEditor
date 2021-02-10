//
//  AppColors.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 07/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

public typealias AppColors = UIColor.AppColorPack

public extension UIColor {
    //
    enum AppColorPack: CaseIterable {
        //
        case normal
        case heavy
        //
        public var color: UIColor {
            switch self {
            case .normal:
                return UIColor(red: 66/255, green: 85/255, blue: 114/255, alpha: 1)
            case .heavy:
                return UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
            }
        }
    }
}
