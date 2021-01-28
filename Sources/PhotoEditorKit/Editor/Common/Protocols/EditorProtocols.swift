import  Foundation

protocol EditorDelegate {
    func activate(control: ControlType)
}

protocol PhotoExposure {
    func update(exposure value: Double)
}
