//
//  MainTVC.swift
//  MedTracker
//
//  Created by Justin Ferre on 10/21/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import UIKit
import CoreData


class MainTVC: UITableViewController, NSFetchedResultsControllerDelegate {

    let moc: NSManagedObjectContext = ((UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext)!
    var frc: NSFetchedResultsController = NSFetchedResultsController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       frc = getFRC()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        }catch {
            return
        }
        self.tableView.rowHeight = 60
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "flatgreen"))
        
        
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        let numberOfSections = frc.sections?.count
        return numberOfSections!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      let numberOfRowsInSection = frc.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }

    
    func fetchRequest() -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "Medicine")
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
        
    }
    
    func getFRC() -> NSFetchedResultsController {
        
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        
        return frc
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clearColor()
        }else {
            
            cell.backgroundColor = UIColor.clearColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            
        }
        
        let med = frc.objectAtIndexPath(indexPath) as! Medicine
        cell.textLabel?.text = med.name
        
        let dosage = med.dosage
        let time = med.time
        
        cell.detailTextLabel?.text = "\(dosage!)mg. at \(time!)."
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        let managedObject: NSManagedObject = frc.objectAtIndexPath(indexPath) as! NSManagedObject
        moc.deleteObject(managedObject)
        
        do {
            try moc.save()
            
        }catch {
            return
            
        }
        
        
    
    
    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "edit" {
            let cell = sender as! UITableViewCell
            
            let indexPath = tableView.indexPathForCell(cell)
            let medController: AddEditMedVC = segue.destinationViewController as! AddEditMedVC
            
            let newMed: Medicine = frc.objectAtIndexPath(indexPath!) as! Medicine
            
            medController.newMed = newMed
        }
        
        
    }
    

    
    
    
    
    
    
}
