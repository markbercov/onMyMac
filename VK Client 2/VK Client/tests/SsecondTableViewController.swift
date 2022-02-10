//
//  TableViewController.swift
//  VK Client
//
//  Created by mark berkov on 21.01.22.
//

import UIKit
import Foundation

class SsecondTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var gr = [AllGroups(name: "Japan girls", image: UIImage(named: "2"), status: false),
              AllGroups(name: "Timon", image: UIImage(named: "3"), status: false),
              AllGroups(name: "Abc", image: nil, status: true), AllGroups(name: "vostok", image: UIImage(systemName: "pencil"), status: false),
    AllGroups(name: "zapad", image: UIImage(systemName: "pencil"), status: false),AllGroups(name: "sosiska v teste", image: UIImage(systemName: "lasso"), status: false),
              AllGroups(name: "pyaterochka", image: UIImage(systemName: "square.and.arrow.up"), status: false)]
    
    var filteredData = [AllGroups]()
    
    //var grs = gr.sorted() { $1.name < $0.name }
    
    var mymy = [AllGroups]()
    
//    @IBAction func loadTo(_ unwindSegue: UIStoryboardSegue) {
//        
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredData = gr
        
        searchBar.delegate = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cellxuel")
        
      //  tableView.register(HeaderFooter.self, forHeaderFooterViewReuseIdentifier: "pipka")
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellxuel", for: indexPath)
            as? TableViewCell else { return UITableViewCell() }
        
        let currentCell = filteredData[indexPath.row]
        
        cell.config(img: currentCell.image ?? UIImage(), l1: currentCell.name, l2: mymy.contains(currentCell))
    

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        //guard
//            let view1 = tableView.dequeueReusableHeaderFooterView(withIdentifier: "pipka") as! HeaderFooter
//        //else { return UIView() }
//        return view1
//    }
//
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "pipka") as! HeaderFooter
//        return view
//    }
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
            gr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "pis", sender: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = gr
        } else {
        for name in gr {
            if name.name.lowercased().contains(searchText.lowercased()) {
                filteredData.append(name)
            }
        }
        }
        self.tableView.reloadData()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
