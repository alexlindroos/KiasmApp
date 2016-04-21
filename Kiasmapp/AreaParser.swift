//
//  AreaParser.swift
//  Kiasmapp
//
//  Created by Juhani Lavonen on 21.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import Foundation

class AreaParser: NSObject,NSXMLParserDelegate {
    
    //
    var currentString = ""
    var appDelegate:AppDelegate?
    var managedContext:NSManagedObjectContext?
    var thisArea:Area?
    
    
    //New instance of parser (myParser) with the data in the parameter
    func parse (xmlData:NSData) {
        let myParser = NSXMLParser(data: xmlData)
        myParser.delegate = self
        myParser.parse()
    }
    
    //delegate protocol method gets called when parser finds the xml document start tag.
    func parserDidStartDocument(parser: NSXMLParser) {
        print ("******************************************* did start document")
        appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        managedContext = appDelegate!.managedObjectContext
    }

    
    
}