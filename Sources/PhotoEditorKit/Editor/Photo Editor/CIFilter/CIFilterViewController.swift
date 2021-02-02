//
//  ExposureViewController.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 28/01/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

import UIKit
import PhotoEditorUI

class CIFilterViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var horizontalSlider: AppSlider!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var horizontalSliderValueLabel: UILabel!
	
    // MARK: Public
    public var filterUpdateDelegate: CIFilterDelegate?
    public var actionDelegate: ActionDelegate?
    
    public var controlType: ControlType? {
        didSet {
            if let controlType = controlType {
                DispatchQueue.main.async {
                    self.adjustSliderMinMax(for: controlType)
                }
            }
        }
    }
	
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
    
    /// Setup slider min and max based on `Control Type`
    /// - Parameter controlType: CI Filter type `exposure`, `brightness` etc.
    private func adjustSliderMinMax(for controlType: ControlType) {
        //
        switch controlType {
        case .exposure,.saturation, .contrast, .sharpness:
            horizontalSlider.minimumValue = 0
            horizontalSlider.maximumValue = 2
            horizontalSlider.value = 1
        case .brightness:
            horizontalSlider.minimumValue = -1
            horizontalSlider.maximumValue = 1
            horizontalSlider.value = 0
        case .vignette:
            horizontalSlider.minimumValue = 0
            horizontalSlider.maximumValue = 1
            horizontalSlider.value = 0.5
        default:
            break
        }
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
        switch controlType {
        case .exposure:
            filterUpdateDelegate?.exposure(with: sliderValue)
        case .brightness:
            filterUpdateDelegate?.brightness(with: sliderValue)
        case .saturation:
            filterUpdateDelegate?.saturation(with: sliderValue)
        case .contrast:
            filterUpdateDelegate?.contrast(with: sliderValue)
        case .sharpness:
            filterUpdateDelegate?.sharpness(with: sliderValue)
        case .vignette:
            filterUpdateDelegate?.vignette(with: sliderValue)
        default:
            break
        }
        
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        actionDelegate?.cancel()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        actionDelegate?.done()
    }
}
