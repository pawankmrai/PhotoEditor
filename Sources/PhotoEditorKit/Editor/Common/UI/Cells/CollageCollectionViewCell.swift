//
//  CollageCollectionViewCell.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 11/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class CollageCollectionViewCell: UICollectionViewCell {
    // MARK:
    @IBOutlet var collageView: UIImageView!
    
    // MARK: Public
    public class var reuseIdentifier: String {
        return "CollageCollectionViewCell"
    }
    
    public var collage: Collage! {
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
        guard let collage = collage else { fatalError("Valid collage not found") }
        
        //
        let bundle = Bundle(for: CollageCollectionViewCell.self)
        collageView.image = UIImage(named: collage.name, in: bundle, compatibleWith: nil)
    }
}
