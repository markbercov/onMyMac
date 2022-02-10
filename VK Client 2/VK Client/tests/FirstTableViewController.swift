//
//  SecondTableViewController.swift
//  VK Client
//
//  Created by mark berkov on 24.01.22.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var my = [AllGroups]()
    
    
    @IBAction func loadTo(_ unwindSegue: UIStoryboardSegue) {
        guard
            unwindSegue.identifier == "pis",
            let secVC = unwindSegue.source as? SsecondTableViewController,
            let curCell = secVC.tableView.indexPathForSelectedRow,
            !my.contains(secVC.gr[curCell.row])
        else { return }
        my.append(secVC.gr[curCell.row])
        
        tableView.reloadData()
    }
    
    //var mySort = my.sorted(by:  )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cellxuel")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return my.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellxuel", for: indexPath) as? TableViewCell else { return  UITableViewCell()}

        let currentCell = my[indexPath.row]
        cell.config(img: currentCell.image ?? UIImage(), l1: currentCell.name, l2: currentCell.status)
    

        return cell

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            my.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard
            segue.identifier == "segue",
            let destVC = segue.destination as? SsecondTableViewController
        
        else {return}
        
        destVC.mymy = my
    }
    

}
