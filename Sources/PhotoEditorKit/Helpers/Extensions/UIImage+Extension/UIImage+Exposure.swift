import UIKit

extension UIImage {
    /**
     Returns a new `UIImage` with an adjusted exposure value.
     - Parameter value: The amount to adjust the exposure value. Negative for darker, positive for lighter.
     - Returns: a new `UIImage` with an adjusted exposure value.
     */
    func adjustedExposure(value: Double) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }

        let filterName = "CIExposureAdjust"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }

        let inputImage = CoreImage.CIImage(cgImage: cgImage)

        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputEVKey)

        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }

        let context = CIContext(options: nil)

        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
    
    /// Return a new `UIImage` with adjusted brightness value
    /// - Parameter value: The amount to adjust the exposure value. Negative for darker, positive for lighter.
    /// - Returns: a new `UIImage` with an adjusted brightness value.
    func adjustedBrightness(value: Double) -> UIImage? {
        //
        guard let cgImage = self.cgImage else { return nil }
        
        let filterName = "CIColorControls"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }
        filter.setDefaults()
        
        //
        let inputImage = CoreImage.CIImage(cgImage: cgImage)
        
        //
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputBrightnessKey)

        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }

        let context = CIContext(options: nil)

        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
    
    func adjustedSaturation(value: Double) -> UIImage? {
        //
        guard let cgImage = self.cgImage else { return nil }
        
        let filterName = "CIColorControls"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }
        filter.setDefaults()
        
        //
        let inputImage = CoreImage.CIImage(cgImage: cgImage)
        
        //
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputSaturationKey)

        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }

        let context = CIContext(options: nil)

        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
    
    func adjustedContrast(value: Double) -> UIImage? {
        //
        guard let cgImage = self.cgImage else { return nil }
        
        let filterName = "CIColorControls"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }
        filter.setDefaults()
        
        //
        let inputImage = CoreImage.CIImage(cgImage: cgImage)
        
        //
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputContrastKey)

        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }

        let context = CIContext(options: nil)

        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
    
    func adjustedSharpness(value: Double) -> UIImage? {
        //
        guard let cgImage = self.cgImage else { return nil }
        
        let filterName = "CISharpenLuminance"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }
        filter.setDefaults()
        
        //
        let inputImage = CoreImage.CIImage(cgImage: cgImage)
        
        //
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputSharpnessKey)
        filter.setValue(1, forKey: kCIInputRadiusKey)
        
        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }
        
        let context = CIContext(options: nil)
        
        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
    
    func adjustedVignette(value: Double) -> UIImage? {
        //
        guard let cgImage = self.cgImage else { return nil }
        
        let filterName = "CIVignette"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }
        filter.setDefaults()
        
        //
        let inputImage = CoreImage.CIImage(cgImage: cgImage)
        
        //
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputIntensityKey)
        
        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }
        
        let context = CIContext(options: nil)
        
        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
}
