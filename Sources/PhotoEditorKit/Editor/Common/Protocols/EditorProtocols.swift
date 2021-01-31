import  Foundation

protocol EditorDelegate {
    func activate(control: ControlType)
}

protocol ActionDelegate {
    func cancel()
    func done()
}

protocol CIFilterDelegate {
    func exposure(with value: Double)
    func brightness(with value: Double)
    func saturation(with value: Double)
    func contrast(with value: Double)
    func sharpness(with value: Double)
    func vignette(with value: Double)
}
