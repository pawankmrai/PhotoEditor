//
//  SizeViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 10/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class SizeViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Public
    public var actionDelegate: ActionDelegate?
    public var sizeUpdateDelegate: PhotoSize?
    
    // MARK: Private
    private var ratios: [AspectRatio] = AspectRatio.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Cancel and Done Actions
    
    @IBAction func cancelTapped(_ sender: Any) {
        actionDelegate?.cancel()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        actionDelegate?.done()
    }
}

extension SizeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return ratios.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SizeCollectionViewCell.reuseIdentifier,
                for: indexPath) as? SizeCollectionViewCell else {
            fatalError("Couldn't deque SizeCollectionViewCell")
        }
        //
        let ratio = ratios[indexPath.row]
        cell.ratio = ratio
        return cell
    }
    
}

extension SizeViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //
        let ratio = ratios[indexPath.row]
        sizeUpdateDelegate?.size(with: ratio)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        //
        let cellWidth = 80
        let cellCount = ratios.count
        let cellSpacing = 10
        let collectionViewWidth = collectionView.bounds.width
        
        //
        let totalCellWidth = cellWidth * cellCount
        let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        let leftInset = max(0.0, (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2)
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
