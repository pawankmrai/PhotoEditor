//
extension BaseEditorViewController: PhotoExposure {
    //
    func update(exposure value: Double) {
        imageView.image = image.imageWithAdjustedExposure(ev: value)
    }
    
}
