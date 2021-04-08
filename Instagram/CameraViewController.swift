//
//  CameraViewController.swift
//  Instagram
//
//  Created by Phoebe Zhong  on 4/6/21.
//  Copyright © 2021 Phoebe Zhong . All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var photoIMG: UIImageView!
    
    @IBOutlet weak var commentTF: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    @IBAction func postBTN(_ sender: Any) {
        //create class in Parse
        
        let post = PFObject(className: "Post")
        post["comment"] = commentTF.text
        post["owner"] = PFUser.current()!
        
        //photo attribute is saved as pgn or url in the Back4app
        let myImgData = (photoIMG.image?.pngData())
        let photo_file = PFFileObject(name: "PostImage.png", data: myImgData!)
        
        post["photo"] = photo_file
        
        post.saveInBackground { (success, error) in
            if success{
                print("post saved successfully")
                self.dismiss(animated: true, completion: nil)   //going back to feed view
            }else{
                print("fail to save post")
            }
        }
        
     }
    
    

    @IBAction func openCameraTap(_ sender: Any) {
        let myCameraPicker = UIImagePickerController()
        myCameraPicker.delegate = self
        myCameraPicker.allowsEditing = true

        if UIImagePickerController.isSourceTypeAvailable(.camera){
            myCameraPicker.sourceType = .camera
            //check if there a camera feature in phone
        }else{
            myCameraPicker.sourceType = .photoLibrary
            //if not, pick a photo from gallery
        }

        present(myCameraPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let myimg = info[.editedImage] as! UIImage
        
        //resize image
        let size = CGSize(width: 300, height: 300)
        
        let scaled_myimg = myimg.af.imageScaled(to: size)
        
        photoIMG.image = scaled_myimg
        
        dismiss(animated: true, completion: nil)    //leaving the gallery selector && going back to the post composing view
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
