//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Ivan Lazarev on 13.07.16.
//  Copyright © 2016 Ivan Lazarev. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    private struct StoryBoard {
        static let ShowImageSegue = "Show Image"
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == StoryBoard.ShowImageSegue{
            if let ivc = segue.destinationViewController as? ImageViewController{
                let imageName = (sender as? UIButton)?.currentTitle
                
            }
        }
    
    }
    

}
