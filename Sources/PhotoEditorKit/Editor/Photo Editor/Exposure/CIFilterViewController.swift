//
//  ExposureViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 28/01/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit

class CIFilterViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var horizontalSlider: UISlider!
	@IBOutlet var titleLabel: UILabel!
	
    // MARK: Public
    public var filterUpdateDelegate: CIFilterDelegate?
	public var controlType: ControlType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		//
		titleLabel.text = controlType?.name
    }
    
    /// Slider change event
    /// - Parameter sender: UISlider
    @IBAction func sliderChanged(_ sender: UISlider) {
        filterUpdateDelegate?.update(exposure: Double(sender.value))
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        performSegue(withIdentifier: "Cancel", sender: self)
    }
    
}
