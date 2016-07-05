//
//  ImageViewController.swift
//  Cassini
//
//  Created by Ivan Lazarev on 05.07.16.
//  Copyright © 2016 Ivan Lazarev. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: NSURL? {
        didSet{
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage(){
        if let url = imageURL{
            if let imageData = NSData(contentsOfURL: url){
                image = UIImage(data: imageData)
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet{
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        set {
            
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
        get {
            return imageView.image
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        
        imageURL = NSURL(string: DemoURL.Stanford)
        

    }
    
    
}
