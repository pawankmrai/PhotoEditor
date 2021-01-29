import  Foundation

protocol EditorDelegate {
    func activate(control: ControlType)
}

protocol CIFilterDelegate {
    func update(exposure value: Double)
}
