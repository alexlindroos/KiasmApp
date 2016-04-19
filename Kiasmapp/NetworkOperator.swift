//
//  NetworkOperator.swift
//  Kiasmapp
//
//  Created by Alex Lindroos on 19.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import Foundation
import UIKit

class NetworkOperator: NSURLSession{
    
    //create NSURLsession and initialize configurations
    let defautlSession  = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    
    //declare data task
    var dataTask: NSURLSessionDataTask?
    
    //get request
    func getAreaData(){
        //UI
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: "http://10.112.194.193:8080/Kiasmapp-backEnd/webresources/Area")
        
        dataTask = defautlSession.dataTaskWithURL(url!){
            data, response, error in
            
            dispatch_async(dispatch_get_main_queue()){
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
            if let error = error{
                print(error.localizedDescription)
            }else if let httpResponse = response as? NSHTTPURLResponse{
                if httpResponse.statusCode == 200 {
                    print("statuscode oli 200")
                    print(data)
                    print(response)
                    
                    
                }
            }
        }
        dataTask?.resume()
        
    }
    
    
    
    
}