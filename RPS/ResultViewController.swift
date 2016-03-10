//
//  ResultViewController.swift
//  RPS
//
//  Created by knn on 10/03/2016.
//  Copyright © 2016 knn. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    
    // Variables
    var resultString: String!
    var imageString: String!
    
    // OutLets
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    
    // function to manage dismissViewController
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("image String: \(imageString.characters.count) ")
        
        myLabel.text = resultString
        myImageView.image = UIImage(named: imageString)
    }
    
    // Actions
    @IBAction func playAgain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
