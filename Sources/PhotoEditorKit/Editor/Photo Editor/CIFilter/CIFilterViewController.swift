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
    @IBOutlet var horizontalSlider: AppSlider!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var horizontalSliderValueLabel: UILabel!
	
    // MARK: Public
    public var filterUpdateDelegate: CIFilterDelegate?
	public var controlType: ControlType?
	
	// MARK: Private
	let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
		return formatter
	}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		//
		titleLabel.text = controlType?.name
		sliderChanged(horizontalSlider)
    }
    
    /// Slider change event
    /// - Parameter sender: UISlider
    @IBAction func sliderChanged(_ sender: UISlider) {
		//
		let sliderValue = Double(sender.value)
		filterUpdateDelegate?.update(exposure: sliderValue)
		
		//
		let number = NSNumber(value: sliderValue)
		horizontalSliderValueLabel.text = formatter.string(from: number)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        performSegue(withIdentifier: "Cancel", sender: self)
    }
    
}
