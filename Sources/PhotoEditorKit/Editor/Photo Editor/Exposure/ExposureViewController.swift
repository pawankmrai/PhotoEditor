//
//  ExposureViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 28/01/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class ExposureViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var horizontalSlider: UISlider!
    
    // MARK: Public
    public var exposureDelegate: PhotoExposure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// Slider change event
    /// - Parameter sender: UISlider
    @IBAction func sliderChanged(_ sender: UISlider) {
        exposureDelegate?.update(exposure: Double(sender.value))
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        performSegue(withIdentifier: "Cancel", sender: self)
    }
    
}
