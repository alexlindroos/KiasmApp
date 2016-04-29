//
//  TableViewController.swift
//  Kiasmapp
//
//  Created by Juhani Lavonen on 26.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var fetchedResultsController: NSFetchedResultsController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //SLIDE 1
        //get products from the network
        let networkOperator = NetworkOperator()
        networkOperator.getProductData()
        
        //set up fetched results controller for the tableview
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let fetchRequest = NSFetchRequest(entityName: "Product")
        let sortDescriptor = NSSortDescriptor(key: "productID", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        tableView.delegate=self
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest:  fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil , cacheName: nil)
        fetchedResultsController!.delegate = self
        
        do {
            try fetchedResultsController?.performFetch()
        } catch let error as NSError {
            print ("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = (tableView.dequeueReusableCellWithIdentifier("cell") as? TableViewCell)
        
        
        if (cell == nil) {
            cell = TableViewCell(style:UITableViewCellStyle.Default , reuseIdentifier: "cell")
        }
        
        let product = fetchedResultsController!.objectAtIndexPath(indexPath)
        
        cell?.productArtist.text = product.valueForKey("artist") as? String
        print(product.valueForKey("artist"))
        cell?.productName.text = product.valueForKey("productName") as? String
        print(product.valueForKey("productName"))
        cell?.productInfo.text = product.valueForKey("productInfo") as? String
        print(product.valueForKey("productInfo"))
      
        
        var url = product.valueForKey("imageURL") as? String
        print(url)
 
        func loadAddresURL(){
            print("alotetaan")
            let requestURL = NSURL(string: String(url!))
            let request = NSURLRequest(URL: requestURL!)
            cell?.webView.loadRequest(request)
            print("lähtiks tää toimii ikinä")
        }
        
        loadAddresURL()
 
 
        
       
        return cell!
    }
 
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows for one section only
        print("********number of objects \(fetchedResultsController!.sections![ section ].numberOfObjects))")
        print("sectioneja on \(section)")
        return fetchedResultsController!.sections![ section ].numberOfObjects
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections = 1
        if let sections = fetchedResultsController?.sections {
            numberOfSections = sections.count
        }
        print("number of sections : \(numberOfSections)")
        return numberOfSections
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var hasVisitedArea: Bool!
    
    
    //pass a value to firstViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueHasVisited") {
            let svc = segue.destinationViewController as! FirstViewController
            svc.hasVisitedArea = true
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        //setting this ViewController as the delegate for fetchedResults controller and
        //providing the empty implementation would make the table view to update automatically
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!did change content")
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }*/
    
    /*  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     
     
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
     
     // Configure the cell...
     
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}



