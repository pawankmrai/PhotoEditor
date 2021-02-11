//
//  ColorListViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 10/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Public
    public var colorUpdateDelegate: TextColor?
    public var actionDelegate: ActionDelegate?
    
    // MARK: Private
    private var colors: [UIColor] = [UIColor.black,
                                     UIColor.white,
                                     UIColor.blue,
                                     UIColor.cyan,
                                     UIColor.green,
                                     UIColor.yellow,
                                     UIColor.red]
    
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

extension ColorListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ColorListCollectionViewCell.reuseIdentifier,
                for: indexPath) as? ColorListCollectionViewCell else {
            fatalError("Couldn't dequeue ColorListCollectionViewCell")
        }
        //
        let color = colors[indexPath.row]
        cell.color = color
        return cell
    }
    
}

extension ColorListViewController: UICollectionViewDelegateFlowLayout {
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //
        let color = colors[indexPath.row]
        colorUpdateDelegate?.color(color)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        //
        let cellWidth = 60
        let cellCount = colors.count
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
