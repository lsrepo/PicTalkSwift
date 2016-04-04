//
//  SentenceTableViewController.swift
//  PicTalkSwift
//
//  Created by Pak on 3/4/2016.
//  Copyright © 2016 Pak. All rights reserved.
//

import UIKit

class SentenceTableViewController: UITableViewController {
    
  
    override func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        print("gonna edit")
    }
  
    @IBOutlet weak var closeButton: UIBarButtonItem!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (share.arraySentence.count > 0)
        {
            return share.arraySentence.count
        }
        else{
           return 0
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sentenceCell", forIndexPath: indexPath) as! SentenceTableViewCell
        
        let index = share.arraySentence[indexPath.row]
        cell.nativeLabel.text = share.dataSource.allPic[index]["swedish"]
        cell.transLabel.text = share.dataSource.allPic[index]["english"]
        cell.picView.image = UIImage(named: share.dataSource.allPic[index]["file"]!)

        return cell
    }
    
    @IBAction func dismIssVC(sender: AnyObject) {
        //print("dismiss!!!")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   
   

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

  
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("compelx stuff called")
        if editingStyle == .Delete {
            tableView.beginUpdates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            share.arraySentence.removeAtIndex(indexPath.row)
            tableView.endUpdates()
            //print("Deleted the row from the data source")
            //print(share.arraySentence)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let subject = share.arraySentence[fromIndexPath.row]
        share.arraySentence.removeAtIndex(fromIndexPath.row)
        share.arraySentence.insert(subject, atIndex: toIndexPath.row)
        
    }
    
  

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation


}
