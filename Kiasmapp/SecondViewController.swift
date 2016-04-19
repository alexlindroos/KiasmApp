//
//  SecondViewController.swift
//  Kiasmapp
//
//  Created by 2 and 1/2 men on 10.4.2016.
//  Copyright © 2016 2 and 1/2 men All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textView2: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //Load images from url
        load_image1("http://users.metropolia.fi/~juhanivl/Project/Domingo.jpg")
        load_image2("http://users.metropolia.fi/~juhanivl/Project/Rosary.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

      //FUNCTION: LOAD IMAGE TO FIRST IMAGEVIEW
    
    func load_image1(urlString:String)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.imageView.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
            
        }
        
        task.resume()
    }
    
    //FUNCTION: LOAD IMAGE TO SECOND IMAGEVIEW
    
    func load_image2(urlString:String)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.imageView2.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
            
        }
        
        task.resume()
    }


}

