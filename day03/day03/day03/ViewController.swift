//
//  ViewController.swift
//  day03
//
//  Created by Harmun Rossouw on 2019/10/11.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //NASA images in an array
    let array:[String] = ["https://wallpaperaccess.com/full/690325.jpg", "https://www.nasa.gov/sites/default/files/thumbnails/image/tess_first_light-tb.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/403c1251.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss059e006521.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia22837-16_0.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/46713638424_0f32acec3f_k.jpg"]
    
    //activity monitor
//    let activityView = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let itemSize = UIScreen.main.bounds.width/2 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = layout
    }
    
    //number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    //populate views
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DataCollectionViewCell
//        cell.myImageView.image = UIImage(named: array[indexPath.row])
        
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.center = cell.contentView.center
        cell.contentView.addSubview(activityView)
        activityView.startAnimating()
        cell.myImageView.downloaded(from: array[indexPath.row])
        
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            activityView.stopAnimating()
        }
        
        return cell
    }
    
}

// https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
//Usage:
//imageView.downloaded(from: "https://corgisrcute/image.jpg")
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
}

