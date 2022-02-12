//
//  GridCollectionViewCell.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 12/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    // MARK:
    @IBOutlet var gridView: UIImageView!
    @IBOutlet var gridName: UILabel!
    
    // MARK: Public
    public class var reuseIdentifier: String {
        return "GridCollectionViewCell"
    }
    
    public var grid: Grid! {
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
        guard let grid = grid else { fatalError("Valid grid not found") }
        //
        gridName.text = grid.name
        //
        let bundle = Bundle(for: CollageCollectionViewCell.self)
        gridView.image = UIImage(named: grid.image, in: bundle, compatibleWith: nil)
    }
}
