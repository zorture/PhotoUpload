//
//  PhotoPickerVC.swift
//  PhotoUpload
//
//  Created by Kanwar Zorawar Singh Rana on 10/14/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

import UIKit

class PhotoPickerVC: UIViewController {
    
    fileprivate let picker = UIImagePickerController()
    fileprivate var imageArray = [UIImage]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        dismiss(animated: true) {
            
        }
    }
    
    @IBAction func uploadButtonClicked(_ sender: UIButton) {
        
        // Create the AlertController
        let actionSheetController = UIAlertController(title: "Please select", message: "How you would like to utilize the app?", preferredStyle: .actionSheet)
        
        // Create and add the Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            // Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        
        // Create and add first option action
        let takePictureAction = UIAlertAction(title: "Camera", style: .default) { action -> Void in
            self.picker.allowsEditing = false
            self.picker.sourceType = .camera
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.present(self.picker, animated: true, completion: nil)
        }
        actionSheetController.addAction(takePictureAction)
        
        // Create and add a second option action
        let choosePictureAction = UIAlertAction(title: "Select Photo", style: .default) { action -> Void in
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.picker, animated: true, completion: nil)
        }
        actionSheetController.addAction(choosePictureAction)
        
        // We need to provide a popover sourceView when using it on iPad
        actionSheetController.popoverPresentationController?.sourceView = sender as UIView
        
        // Present the AlertController
        self.present(actionSheetController, animated: true, completion: nil)
        
    }

}

extension PhotoPickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Delegates
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageArray.append(chosenImage)
        dismiss(animated: true) {
            self.collectionView.reloadData()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension PhotoPickerVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.imageView.image = imageArray[indexPath.row]
        return cell
    }
}

class ImageCell: UICollectionViewCell {
        @IBOutlet weak var imageView: UIImageView!
}
