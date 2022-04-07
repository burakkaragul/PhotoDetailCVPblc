//
//  ViewController.swift
//  PhotoDetailCV
//
//  Created by Burak Karagül on 31.12.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    var pictures=[String]()
    
    override func viewDidLoad() {
        CollectionView.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("Brk"){
                pictures.append(item)
            }
        }

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
        layout.itemSize=CGSize(width: 190, height: 200)
        CollectionView.collectionViewLayout=layout
        
    }
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)  -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.label?.text=String(pictures[indexPath.row])
        cell.imageView?.image=UIImage(named: pictures[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage=pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

