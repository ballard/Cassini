//
//  ImageViewController.swift
//  Cassini
//
//  Created by Ivan Lazarev on 05.07.16.
//  Copyright © 2016 Ivan Lazarev. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL: NSURL? {
        didSet{
            image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private func fetchImage(){
        if let url = imageURL{
            spinner?.startAnimating()
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)){
                [weak weakSelf = self] in
                let contentOfUrl = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()){
                    if url == weakSelf?.imageURL{
                        if let imageData = contentOfUrl {
                            weakSelf?.image = UIImage(data: imageData)
                        } else {
                            weakSelf?.spinner?.stopAnimating()
                        }
                    } else {
                        print("url dropped")
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet{
            scrollView?.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        set {
            
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
        get {
            return imageView.image
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImage()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
}
