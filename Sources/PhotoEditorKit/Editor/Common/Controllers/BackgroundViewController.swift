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
    public var backgroundColorDelegate: TextLayerBackground?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- Background color action
    @IBAction func enableBackgroundLayer(_ sender: UISwitch) {
        backgroundColorDelegate?.layerBackground(active: sender.isOn)
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        backgroundColorDelegate?.layerBackgroundColor(with: sender)
    }
    
    @IBAction func changeOpacity(_ sender: Any) {
        backgroundColorDelegate?.layerBackgroundOpacity()
    }
    
    // MARK:- Cancel and Done Actions
    
    @IBAction func cancelTapped(_ sender: Any) {
        actionDelegate?.cancel()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        actionDelegate?.done()
    }
}
