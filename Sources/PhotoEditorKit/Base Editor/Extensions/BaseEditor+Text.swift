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
    func layerBackground(active: Bool) {
    }
    
    func layerBackground(color: UIColor) {
    }
    
    func layerBackground(opacity: Double) {
    }
    
}

// MARK:- Text Shadow

extension BaseEditorViewController: TextShadow {
    //
    func shawdow(color: UIColor) {
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
