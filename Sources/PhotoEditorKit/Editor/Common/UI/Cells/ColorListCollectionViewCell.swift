//
//  ColorListCollectionViewCell.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 10/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class ColorListCollectionViewCell: UICollectionViewCell {
    // MARK:- Public
    public class var reuseIdentifier: String {
        return "ColorListCollectionViewCell"
    }
    
    public var color: UIColor! {
        didSet {
            configure()
        }
    }
    // MARK: IBOutlets
    @IBOutlet var colorView: UIView!
    
    // MARK:- Init
    public override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepareView()
    }
    
    private func prepareView() {
        //
        colorView.layer.cornerRadius = 15
        
        // Add border for white color
        if color ==  UIColor.white {
            colorView.layer.borderWidth = 1.0
            colorView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1).cgColor
        }
    }
    
    private func configure() {
        colorView.backgroundColor = color
    }
}
