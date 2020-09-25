//
//  ViewController.swift
//  ImportImage
//
//  Created by Tran Cong Hieu on 9/25/20.
//  Copyright © 2020 Tran Cong Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var imgNew: UIImageView!
    var alertController :UIAlertController?
    var pickerController:UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func btnAddImage(_ sender: Any) {
       alertController = UIAlertController(title: "Take Image", message: "Choose Image Source", preferredStyle: .actionSheet)
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (_) in
            print("You Choose Camera")
            self.openCamera()
        }
        let actionPhoto = UIAlertAction(title: "Photo", style: .default) { (_) in
            print("You Choose Photo")
            self.openPhoto()
        }

        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
                print("You Choose Cancel")
           
        }
        alertController?.addAction(actionCamera)
        alertController?.addAction(actionPhoto)
     
        alertController?.addAction(actionCancel)
        
        present(alertController!, animated: true)
        
    }
    func openCamera() {
        pickerController = UIImagePickerController()
        if (UIImagePickerController.isSourceTypeAvailable(.camera) == false) {
            return
        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true){
            print("present open Camera")
        }
        
        
    }
    func openPhoto(){
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary
        self.present(pickerController!, animated: true) {
            print("present open Librart")
        }
       
    }
    // NavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImage:UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        self.imgNew?.image = chooseImage
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}

