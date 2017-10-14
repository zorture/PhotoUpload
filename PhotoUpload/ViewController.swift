//
//  ViewController.swift
//  PhotoUpload
//
//  Created by Kanwar Zorawar Singh Rana on 10/14/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func photoPickerClicked(_ sender: UIButton) {
        
        if let photoPickerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoPickerVC") as? PhotoPickerVC{
        photoPickerVC.modalPresentationStyle = .fullScreen
        present(photoPickerVC, animated: true, completion: nil)
        }
        
    }
    
}

