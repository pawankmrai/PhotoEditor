//
//  BaseEditor+Photo.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 03/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//

extension BaseEditorViewController: CIFilterDelegate {
    //
    func saturation(with value: Double) {
        imageView.image = image.adjustedSaturation(value: value)
    }
    
    func contrast(with value: Double) {
        imageView.image = image.adjustedContrast(value: value)
    }
    
    func sharpness(with value: Double) {
        imageView.image = image.adjustedSharpness(value: value)
    }
    
    func vignette(with value: Double) {
        imageView.image = image.adjustedVignette(value: value)
    }
    
    //
    func exposure(with value: Double) {
        imageView.image = image.adjustedExposure(value: value)
    }
    
    func brightness(with value: Double) {
        imageView.image = image.adjustedBrightness(value: value)
    }
}
