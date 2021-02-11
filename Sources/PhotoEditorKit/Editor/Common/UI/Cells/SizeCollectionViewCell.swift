//
//  SizeCollectionViewCell.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 10/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet var ratioView: UIView!
    @IBOutlet var ratioLabel: UILabel!
    
    // MARK: Public
    public class var reuseIdentifier: String {
        return "SizeCollectionViewCell"
    }
    
    public var ratio: AspectRatio! {
        didSet {
            prepareView()
        }
    }
    
    // MARK: Init
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepareView()
    }
    
    private func prepareView() {
        //
        guard let ratio = ratio, let ratioView = ratioView else { fatalError("Valid aspect ratio not found") }
        
        //
        ratioLabel.text = ratio.name
        ratioView.addConstraint(NSLayoutConstraint(item: ratioView,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: ratioView,
                                                   attribute: .width,
                                                   multiplier: ratio.value,
                                                   constant: 0))
        ratioView.layer.borderWidth = 1.0
        ratioView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1).cgColor
        
        // make the circle
        if ratio == .circle {
            ratioView.layer.cornerRadius = ratioView.bounds.width / 2
        }
    }
    
}
