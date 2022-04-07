//
//  DetailViewController.swift
//  PhotoDetailCV
//
//  Created by Burak Karagül on 3.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad=selectedImage{
            imageView.image=UIImage(named: imageToLoad)
        }
        

    }
//                  *****NavigaionBar İptali********
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    

    
    @IBAction func backAction(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
       
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
//                      **********************
    
}

