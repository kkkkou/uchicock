//
//  PhotoFilterViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2017/12/26.
//  Copyright © 2017年 Kou. All rights reserved.
//

import UIKit

class PhotoFilterViewController: UIViewController {

    var image : UIImage?
    var smallImage : UIImage?
    let queue = DispatchQueue(label: "queue")
    var buttonWidth:CGFloat = 100
    var buttonHeight: CGFloat = 100
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var CIFilterNames = [
        "Original",
        "CIPhotoEffectTransfer",
        "Nashville",
        "CIPhotoEffectChrome",
        "Clarendon",
        "CIPhotoEffectFade",
        "Toaster",
        "CIPhotoEffectInstant",
        "CIPhotoEffectProcess",
        "CILinearToSRGBToneCurve",
        "1977",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 3
        button.tintColor = UIColor.white

        titleLabel.textColor = UIColor.white

        print("aaa")
        self.dismiss(animated: true, completion: nil)
        print("bb")
        imageView.image = image
        if let im = image{
            smallImage = resizedImage(image: im)
        }
        
        buttonWidth = scrollView.frame.height - 20
        buttonHeight = scrollView.frame.height - 20

        queue.async {
            self.setFilters()
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setFilters(){
        var xCoord: CGFloat = 10
        let yCoord: CGFloat = 10
        let gapBetweenButtons: CGFloat = 5
        
        var itemCount = 0
        for i in 0..<CIFilterNames.count {
            itemCount = i
            
            let filterButton = UIButton(type: .custom)
            filterButton.frame = CGRect(x: xCoord, y: yCoord, width: buttonWidth, height: buttonHeight)
            filterButton.tag = itemCount
            filterButton.addTarget(self, action: #selector(PhotoFilterViewController.filterButtonTapped(sender:)), for: .touchUpInside)
            filterButton.layer.cornerRadius = 10
            filterButton.clipsToBounds = true
            
            if let smim = smallImage{
                if let ciim = CIImage(image: smim){
                    filterButton.setImage(filteredImage(filterNumber: i, originalImage: ciim), for: .normal)
                    filterButton.imageView?.contentMode = .scaleAspectFill
                    
                    xCoord +=  buttonWidth + gapBetweenButtons
                    if i == 0{
                        filterButton.layer.borderColor = UIColor.white.cgColor
                        filterButton.layer.borderWidth = 2.0
                    }else{
                        filterButton.layer.borderWidth = 0
                    }
                    DispatchQueue.main.async{
                        self.scrollView.addSubview(filterButton)
                    }
                }
            }
        }
        DispatchQueue.main.async{
            self.scrollView.contentSize = CGSize(width: xCoord + 10, height: self.buttonHeight)
        }
    }

    @objc func filterButtonTapped(sender: UIButton){
        let button = sender as UIButton
        guard let im = self.image else{ return }
        guard let ciim = CIImage(image: im) else{ return }
        imageView.image = filteredImage(filterNumber: button.tag, originalImage: ciim)
        
        for subview in scrollView.subviews{
            if subview is UIButton{
                let b = subview as! UIButton
                b.layer.borderWidth = 0
            }
        }
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2.0
    }
    
    func filteredImage(filterNumber: Int, originalImage: CIImage) -> UIImage{
        let ciContext = CIContext(options: nil)
        var filteredImageData : CIImage? = nil
        
        switch CIFilterNames[filterNumber]{
        case "Original":
            filteredImageData = originalImage
        case "Nashville":
            filteredImageData = applyNashvilleFilter(foregroundImage: originalImage)
        case "Clarendon":
            filteredImageData = applyClarendonFilter(foregroundImage: originalImage)
        case "1977":
            filteredImageData = apply1977Filter(ciImage: originalImage)
        case "Toaster":
            filteredImageData = applyToasterFilter(ciImage: originalImage)
        default:
            let filter = CIFilter(name: "\(CIFilterNames[filterNumber])" )
            if let fil = filter {
                fil.setDefaults()
                fil.setValue(originalImage, forKey: kCIInputImageKey)
                filteredImageData = fil.value(forKey: kCIOutputImageKey) as? CIImage
            }
        }
        
        if let fimg = filteredImageData{
            let filteredImageRef = ciContext.createCGImage(fimg, from: fimg.extent)
            return UIImage(cgImage: filteredImageRef!)
        }else{
            let filteredImageRef = ciContext.createCGImage(originalImage, from: originalImage.extent)
            return UIImage(cgImage: filteredImageRef!)
        }
    }
    
    func resizedImage(image: UIImage) -> UIImage? {
        let maxLongSide : CGFloat = (scrollView.frame.height - 20) * 2
        if  image.size.width <= maxLongSide && image.size.height <= maxLongSide {
            return image
        }
        
        let w = image.size.width / maxLongSide
        let h = image.size.height / maxLongSide
        let ratio = w > h ? w : h
        let rect = CGRect(x: 0, y: 0, width: image.size.width / ratio, height: image.size.height / ratio)
        
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func getColorImage( red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0, rect: CGRect) -> CIImage {
        let color = CIColor(red: red, green: green, blue: blue, alpha: alpha)
        return CIImage(color: color).cropped(to: rect)
    }

    // MARK: - Original Filters
    func applyNashvilleFilter(foregroundImage: CIImage) -> CIImage? {
        let backgroundImage = getColorImage(
            red: 0.97, green: 0.69, blue: 0.6, alpha: 0.56, rect: foregroundImage.extent)
        let backgroundImage2 = getColorImage(
            red: 0.0, green: 0.27, blue: 0.59, alpha: 0.4, rect: foregroundImage.extent)
        return foregroundImage
            .applyingFilter("CIDarkenBlendMode", parameters: [
                "inputBackgroundImage": backgroundImage,
                ])
            .applyingFilter("CISepiaTone", parameters: [
                "inputIntensity": 0.2,
                ])
            .applyingFilter("CIColorControls", parameters: [
                "inputSaturation": 1.2,
                "inputBrightness": 0.05,
                "inputContrast": 1.1,
                ])
            .applyingFilter("CILightenBlendMode", parameters: [
                "inputBackgroundImage": backgroundImage2,
                ])
    }
    
    func applyClarendonFilter(foregroundImage: CIImage) -> CIImage? {
        let backgroundImage = getColorImage(
            red: 0.5, green: 0.73, blue: 0.89, alpha: 0.2, rect: foregroundImage.extent)
        return foregroundImage
            .applyingFilter("CIOverlayBlendMode", parameters: [
                "inputBackgroundImage": backgroundImage,
                ])
            .applyingFilter("CIColorControls", parameters: [
                "inputSaturation": 1.35,
                "inputBrightness": 0.05,
                "inputContrast": 1.1,
                ])
    }
    
    func apply1977Filter(ciImage: CIImage) -> CIImage? {
        let filterImage = getColorImage(
            red: 0.95, green: 0.42, blue: 0.74, alpha: 0.1, rect: ciImage.extent)
        let backgroundImage = ciImage
            .applyingFilter("CIColorControls", parameters: [
                "inputSaturation": 1.3,
                "inputBrightness": 0.1,
                "inputContrast": 1.05,
                ])
            .applyingFilter("CIHueAdjust", parameters: [
                "inputAngle": 0.3,
                ])
        return filterImage
            .applyingFilter("CIScreenBlendMode", parameters: [
                "inputBackgroundImage": backgroundImage,
                ])
            .applyingFilter("CIToneCurve", parameters: [
                "inputPoint0": CIVector(x: 0, y: 0),
                "inputPoint1": CIVector(x: 0.25, y: 0.20),
                "inputPoint2": CIVector(x: 0.5, y: 0.5),
                "inputPoint3": CIVector(x: 0.75, y: 0.80),
                "inputPoint4": CIVector(x: 1, y: 1),
                ])
    }
    
    func applyToasterFilter(ciImage: CIImage) -> CIImage? {
        let width = ciImage.extent.width
        let height = ciImage.extent.height
        let centerWidth = width / 2.0
        let centerHeight = height / 2.0
        let radius0 = min(width / 4.0, height / 4.0)
        let radius1 = min(width / 1.5, height / 1.5)
        
        let color0 = CIColor(red: 128.0/255.0, green: 78.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        let color1 = CIColor(red: 79.0/255.0, green: 0.0, blue: 79.0/255.0, alpha: 1.0)
        let circle = CIFilter(name: "CIRadialGradient", withInputParameters: [
            "inputCenter": CIVector(x: centerWidth, y: centerHeight),
            "inputRadius0": radius0,
            "inputRadius1": radius1,
            "inputColor0": color0,
            "inputColor1": color1,
            ])?.outputImage?.cropped(to: ciImage.extent)
        
        return ciImage
            .applyingFilter("CIColorControls", parameters: [
                "inputSaturation": 1.0,
                "inputBrightness": 0.01,
                "inputContrast": 1.1,
                ])
            .applyingFilter("CIScreenBlendMode", parameters: [
                "inputBackgroundImage": circle!,
                ])
    }
    
    // MARK: - IBAction
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FilterFinished", sender: self)
    }

}
