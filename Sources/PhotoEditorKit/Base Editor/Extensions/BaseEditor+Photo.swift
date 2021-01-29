//
extension BaseEditorViewController: CIFilterDelegate {
    //
    func update(exposure value: Double) {
        imageView.image = image.imageWithAdjustedExposure(ev: value)
    }
    
}
