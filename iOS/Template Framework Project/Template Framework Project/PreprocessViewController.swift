//
//  PreprocessViewController.swift
//  Template Framework Project
//
//  Created by Matthew Cheung on 1/17/17.
//  Copyright © 2017 Daniele Galiotto - www.g8production.com. All rights reserved.
//

import UIKit
import WDReceiptOCR

public extension OCR {
    public func doSomething() {
        //nothing
    }
}

class PreprocessViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let image = UIImage(named: "testresume")!
    var corners : Corners!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    @IBAction func detectCorners(_ sender: UIButton) {
        let cornersResult = ImagePreprocessor.detectCornersInImage(image)
        corners = cornersResult.corners
        print("Cofidence: \(cornersResult.isConfident)")
        print("TL: \(corners.topLeft)")
        print("TR: \(corners.topRight)")
        print("BL: \(corners.bottomLeft)")
        print("BR: \(corners.bottomRight)")
        
        let points = [corners.topLeft, corners.topRight,
                      corners.bottomLeft, corners.bottomRight]
        let size  = CGSize(width: 10, height: 10)
        for point in points {
            let convertedPoint = CGPoint(x: ((point.x/image.size.width)*imageView.bounds.size.width)-5,
                                         y: ((point.y/image.size.height)*imageView.bounds.size.height)-5)
            let view = UIView(frame: CGRect(origin: convertedPoint, size: size))
            view.backgroundColor = UIColor.red
            imageView.addSubview(view)
        }
    }
    
    @IBAction func processImage(_ sender: UIButton) {
        let newImage = ImagePreprocessor.preprocessImage(image, corners: corners)
        imageView.subviews.forEach { $0.removeFromSuperview() }
        imageView.image = newImage
    }
    
    @IBAction func parseText(_ sender: UIButton) {
        let ocr = OCR(withPreprocessedImage: imageView.image!, forLanguage: "eng")
        let recognizedData = ocr.recognizeReceipt()
        for data in recognizedData {
            let imageSize = imageView.bounds.size
            let convertedRect = CGRect(x: data.block.rect.minX * imageSize.width,
                                       y: data.block.rect.minY * imageSize.height,
                                       width: data.block.rect.width * imageSize.width,
                                       height: data.block.rect.height * imageSize.height)
            let view = UIView(frame: convertedRect)
            view.backgroundColor = UIColor.red
            view.alpha = 0.3
            imageView.addSubview(view)
        }
    }

}
