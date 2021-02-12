//
//  BaseEditor+Text.swift
//  PhotoEditorKit
//
//  Created by VDB Developer on 03/02/21.
//  Copyright © 2021 Pawan. All rights reserved.
//
import UIKit
import PhotoEditorUI

// MARK:- Layer Background

extension BaseEditorViewController: TextLayerBackground {
    //
    func layerBackgroundColor(with button: UIButton) {
        let colorPickerViewController = AppColorPickerViewController()
        colorPickerViewController.colorPickerDelegate = self
        colorPickerViewController.modalPresentationStyle = .popover
        colorPickerViewController.preferredContentSize = CGSize(width: UIScreen.main.bounds.width / 0.6,
                                                                height: UIScreen.main.bounds.height / 0.6)
        if let popoverController = colorPickerViewController.popoverPresentationController {
            popoverController.sourceView = button
            popoverController.permittedArrowDirections = .any
            popoverController.delegate = self
            //colorPickerViewController.delegate = self
        }
        present(colorPickerViewController, animated: true, completion: nil)
    }
    
    func layerBackgroundOpacity() {
        performSegue(withIdentifier: SegueType.slider.rawValue, sender: ControlType.opacity)
    }
    
    //
    func layerBackground(active: Bool) {
        
    }
    
}

extension BaseEditorViewController: UIPopoverPresentationControllerDelegate {
    // Override the iPhone behaviour that presents a popover as fullscreen
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
}

extension BaseEditorViewController: ColorPickerDelegate {
    //
    public func selected(color: UIColor) {
        imagePreviewView.backgroundColor = color
    }
    
}

// MARK:- Text Shadow

extension BaseEditorViewController: TextShadow {
    //
    func shadow(color: UIColor) {
    }
    
    func shadow(opacity: Double) {
    }
    
}

// MARK:- Text Font

extension BaseEditorViewController: TextFont {
    //
    func font(name: String) {
        imageView.fontName = name
    }
    
    func font(size: Int) {
        
    }
    
}

// MARK:- Text Color

extension BaseEditorViewController: TextColor {
    //
    func color(_: UIColor) {
    }
    
}

// MARK:- Text Fade

extension BaseEditorViewController: TextFade {
    //
    func fade(value: Double) {
    }
    
}

// MARK:- Text Layer Rotate

extension BaseEditorViewController: TextLayerRotate {
    //
    func layerRotate(angle: Int) {
    }
    
}
