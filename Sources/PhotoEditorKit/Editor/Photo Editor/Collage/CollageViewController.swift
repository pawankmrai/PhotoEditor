//
//  CollageViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 11/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class CollageViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Public
    public var actionDelegate: ActionDelegate?
    public var collageCreateDelegate: CollageShape?
    
    // MARK: Private
    private var collages: [Collage] = Collage.allCases
    
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

extension CollageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return collages.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollageCollectionViewCell.reuseIdentifier,
                for: indexPath) as? CollageCollectionViewCell else {
            fatalError("Couldn't dequeue CollageCollectionViewCell")
        }
        //
        let collage = collages[indexPath.row]
        cell.collage = collage
        return cell
    }
    
}

extension CollageViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //
        let collage = collages[indexPath.row]
        collageCreateDelegate?.create(collage: collage)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        //
        let cellWidth = 50
        let cellCount = collages.count
        let cellSpacing = 0
        let collectionViewWidth = collectionView.bounds.width
        
        //
        let totalCellWidth = cellWidth * cellCount
        let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        let leftInset = max(0.0, (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2)
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
