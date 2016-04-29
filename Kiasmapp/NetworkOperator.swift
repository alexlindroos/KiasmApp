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
    let defaultSession  = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    
    //declare data task
    var dataTask: NSURLSessionDataTask?
    
    //get request
    func getAreaData(){
        //UI
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: "http://10.112.196.72:8080/Kiasmapp-backEnd/webresources/Area")
        
        dataTask = defaultSession.dataTaskWithURL(url!){
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
                    let parser = Parser()
                    parser.parse(data!)
                    
                    
                }
            }
        }
        dataTask?.resume()
        
    }
    
    func getProductData(){
        //UI
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    
        let url = NSURL(string: "http://10.112.196.72:8080/Kiasmapp-backEnd/webresources/Products")
        
        dataTask = defaultSession.dataTaskWithURL(url!){
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
                    let parserProduct = ParserProduct()
                    parserProduct.parse(data!)
                    
                    
                }
            }
        }
        dataTask?.resume()
        
    }
    

    
    func postData(tulos:String){
        let request = NSMutableURLRequest()
   
        request.HTTPMethod = "POST"
        request.URL = NSURL(string: "http://10.112.196.72:8080/Kiasmapp-backEnd/webresources/Visits")
        request.addValue("application/xml", forHTTPHeaderField: "Content-Type")
        request.addValue("application/xml", forHTTPHeaderField: "Accept")
        
        
        let body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n <visit><time>\(tulos) </time></visit>\n"
        
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        print("Request made in postData()")
        print("Tulos is \(tulos)")
        
        let sessionTask = defaultSession.dataTaskWithRequest(request, completionHandler: {(data, response, error) -> Void in
            print("posting done, response = \(response), error = \(error)")
        })
        sessionTask.resume()
        
    }
}
