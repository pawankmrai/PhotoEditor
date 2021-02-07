//
//  ShadowViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 07/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit
import PhotoEditorUI

class ShadowViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var horizontalSlider: AppSlider!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var horizontalSliderValueLabel: UILabel!
    
    // MARK: Public
    public var actionDelegate: ActionDelegate?
    public var textShadowDelegate: TextShadow?
    
    // MARK: Private
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adjust slider min & max
        horizontalSlider.minimumValue = 0
        horizontalSlider.maximumValue = 1
        horizontalSlider.value = 0.5
    }
    
    /// Slider change event
    /// - Parameter sender: UISlider
    @IBAction func sliderChanged(_ sender: UISlider) {
        //
        let sliderValue = Double(sender.value)
        
        //
        let number = NSNumber(value: sliderValue)
        horizontalSliderValueLabel.text = formatter.string(from: number)
        
        //
        // textShadowDelegate?.shadow(opacity: <#T##Double#>)
    }
    // MARK:- Cancel and Done Actions
    
    @IBAction func cancelTapped(_ sender: Any) {
        actionDelegate?.cancel()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        actionDelegate?.done()
    }
}

