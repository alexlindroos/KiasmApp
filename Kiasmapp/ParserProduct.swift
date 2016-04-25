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

class ParserProduct:NSObject, NSXMLParserDelegate {
    
    var currentString = ""
    var managedContext:NSManagedObjectContext?
    var thisProduct:Product?
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
        
        if (elementName == "Product") {
            print ("did start element product \(currentString)")
            thisProduct = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: managedContext!) as? Product
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        print ("found characters: \(string)")
        currentString = currentString + string
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
      
        print ("currentString=\(currentString)")
        if (elementName == "Product") {
            print("did end element student \(currentString)")
        } else if(elementName == "artist") {
            thisProduct?.artist = currentString
        }else if(elementName == "imageURL") {
            thisProduct?.imageURL = currentString
        } else if (elementName == "productID") {
            thisProduct?.productID = NSNumber(integer: Int(currentString)!)
        } else if(elementName == "productInfo") {
            thisProduct?.productInfo = currentString
        } else if(elementName == "productName") {
            thisProduct?.productName = currentString
        }
        currentString = ""
    }
}