//
//  GridViewController.swift
//  PhotoEditorKit
//
//  Created by Pawan on 12/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Public
    public var actionDelegate: ActionDelegate?
    public var gridCreateDelegate: GridShape?
    
    // MARK: Private
    private var grids: [Grid] = Grid.allCases
    
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

extension GridViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return grids.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GridCollectionViewCell.reuseIdentifier,
                for: indexPath) as? GridCollectionViewCell else {
            fatalError("Couldn't dequeue GridCollectionViewCell")
        }
        //
        let grid = grids[indexPath.row]
        cell.grid = grid
        return cell
    }
    
}

extension GridViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //
        let grid = grids[indexPath.row]
        gridCreateDelegate?.create(grid: grid)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        //
        let cellWidth = 70
        let cellCount = grids.count
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
