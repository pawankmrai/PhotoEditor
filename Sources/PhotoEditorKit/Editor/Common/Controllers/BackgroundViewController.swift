//
//  BackgroundViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 07/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    // MARK: Public
    public var actionDelegate: ActionDelegate?
    
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
