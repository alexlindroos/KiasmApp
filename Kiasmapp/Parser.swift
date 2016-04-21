//
//  Parser.swift
//  Kiasmapp
//
//  Created by iosdev on 20.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Parser:NSObject, NSXMLParserDelegate {
    
    var currentString = ""
    var managedContext:NSManagedObjectContext?
    var thisArea:Area?
    var appDelegate:AppDelegate?
    
    func parse (xmlData:NSData) {
        let myParser = NSXMLParser(data: xmlData)
        myParser.delegate = self
        myParser.parse()
    }
    
    func parserDidStartDocument(parser: NSXMLParser) {
        print ("******************************************* did start document")
        appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        managedContext = appDelegate!.managedObjectContext
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        print ("******************************************* did end document")
        //save the parsed objects to persistent storage
        do {
            try managedContext!.save()
        } catch let error as NSError {
            print("Saving failed with error \(error), \(error.userInfo)")
        }
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print("found element: \(elementName)")
        
        if (elementName == "Area") {
            print ("did start element student \(currentString)")
            thisArea = NSEntityDescription.insertNewObjectForEntityForName("Area", inManagedObjectContext: managedContext!) as? Area
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        print ("found characters: \(string)")
        currentString = currentString + string
    }

    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //print("elementName= \(elementName)")
        print ("currentString=\(currentString)")
        if (elementName == "Area") {
            print("did end element student \(currentString)")
        } else if (elementName == "areaID") {
            thisArea?.areaID = NSNumber(integer: Int(currentString)!)
        } else if(elementName == "areaInfo") {
            thisArea?.areaInfo = currentString
        } else if(elementName == "areaName") {
            thisArea?.areaName = currentString
        }else if(elementName == "mapURL") {
            thisArea?.mapURL = currentString
        }
        currentString = ""
    }
}