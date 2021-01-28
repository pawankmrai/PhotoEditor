import UIKit

extension UIImage {
    /**
     Returns a new `UIImage` with an adjusted exposure value.
     - Parameter ev: The amount to adjust the exposure value. Negative for darker, positive for lighter.
     - Returns: a new `UIImage` with an adjusted exposure value.
     */
    func imageWithAdjustedExposure(ev: Double) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }

        let filterName = "CIExposureAdjust"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }

        let inputImage = CoreImage.CIImage(cgImage: cgImage)

        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(ev, forKey: kCIInputEVKey)

        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }

        let context = CIContext(options: nil)

        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
}
