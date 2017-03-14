//
//  PictureViewController.swift
//  Template Framework Project
//
//  Created by Matthew Cheung on 1/23/17.
//  Copyright © 2017 Daniele Galiotto - www.g8production.com. All rights reserved.
//

import UIKit
import SwiftyButton
import ChameleonFramework

//public extension OCR {
//    public func doSomething() {
//        //nothing
//    }
//}

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraButton: PressableButton!
    @IBOutlet weak var photoButton: PressableButton!
    
//    var corners : Corners!
    var resumeImage: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        self.navigationController?.navigationBar.backgroundColor = FlatBlueDark()
        self.navigationController?.hidesNavigationBarHairline = true



        self.cameraButton.colors = .init(
            button: UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1),
            shadow: UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1))
        
        self.cameraButton.shadowHeight = 5
        self.cameraButton.cornerRadius = 5
        self.cameraButton.setTitle("Open Camera", for: .normal)
        
        self.photoButton.colors = .init(
            button: UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1),
            shadow: UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1))
        
        self.photoButton.shadowHeight = 5
        self.photoButton.cornerRadius = 5
        self.photoButton.setTitle("Open Photo Library", for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
//        let cornersResult = ImagePreprocessor.detectCornersInImage(image!)
//        corners = cornersResult.corners
//        let newImage = ImagePreprocessor.preprocessImage(image!, corners: corners)
//        resumeImage = newImage
        resumeImage = image
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
