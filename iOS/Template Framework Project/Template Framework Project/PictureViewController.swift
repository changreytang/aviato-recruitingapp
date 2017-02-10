//
//  PictureViewController.swift
//  Template Framework Project
//
//  Created by Matthew Cheung on 1/23/17.
//  Copyright © 2017 Daniele Galiotto - www.g8production.com. All rights reserved.
//

import UIKit
import WDReceiptOCR

public extension OCR {
    public func doSomething() {
        //nothing
    }
}

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var corners : Corners!
    var resumeImage: UIImage?
    
//    @IBOutlet weak var imagePicked: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openPhotoLibrary(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = .photoLibrary
            imgPicker.delegate = self
            self.present(imgPicker, animated: true, completion: { _ in })
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image: UIImage? = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        let cornersResult = ImagePreprocessor.detectCornersInImage(image!)
        corners = cornersResult.corners
//        print("Cofidence: \(cornersResult.isConfident)")
//        print("TL: \(corners.topLeft)")
//        print("TR: \(corners.topRight)")
//        print("BL: \(corners.bottomLeft)")
//        print("BR: \(corners.bottomRight)")
//        
//        corners = Corners(topLeft: CGPoint(x: 0, y: 0),
//                topRight: CGPoint(x: 1, y: 0),
//                bottomLeft: CGPoint(x: 0, y: 1),
//                bottomRight: CGPoint(x: 1, y: 1))
//        let points = [corners.topLeft, corners.topRight,
//                      corners.bottomLeft, corners.bottomRight]
//        let size  = CGSize(width: 10, height: 10)
//        for point in points {
//            let convertedPoint = CGPoint(x: ((point.x/(image?.size.width)!)*imagePicked.bounds.size.width)-5,
//                                         y: ((point.y/(image?.size.height)!)*imagePicked.bounds.size.height)-5)
//            let view = UIView(frame: CGRect(origin: convertedPoint, size: size))
//            view.backgroundColor = UIColor.red
//            imagePicked.addSubview(view)
//        }
        let newImage = ImagePreprocessor.preprocessImage(image!, corners: corners)
        resumeImage = newImage
        
        picker.dismiss(animated: true, completion: { _ in })
        self.performSegue(withIdentifier: "cropSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "cropSegue") {
            let controller: CropViewController = (segue.destination as? CropViewController)!
            controller.resumeImage = resumeImage!
        }
    }
}
