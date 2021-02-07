//
//  FontListCollectionViewCell.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 04/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class FontListCollectionViewCell: UICollectionViewCell {
    // MARK:- Public
    public class var reuseIdentifier: String {
        return "FontListCollectionViewCell"
    }
    
    public var font: String! {
        didSet {
            configure()
        }
    }
    
    // MARK:- IBOutlets
    @IBOutlet private var fontNameLabel: UILabel!
    
    // MARK:- Init
    public override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configure() {
        //
        fontNameLabel.font = UIFont(name: font, size: 15)
        fontNameLabel?.text = font
    }
}
