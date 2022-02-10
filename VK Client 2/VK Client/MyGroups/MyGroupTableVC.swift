//
//  MyGroupTableVC.swift
//  VK Client
//
//  Created by mark berkov on 21.12.21.
//

import UIKit

class MyGroupTableVC: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var myGroups: [AllGroups] = [
        AllGroups(name: "Bad Girl", image: UIImage(named: "1"), status: false),
    ]
    
    var filterGroups = [AllGroups]()
    var ib = [AllGroups]()
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == "addGroup",
              
              let addGroup = segue.source as? AllGroupsTableVC,
              
              let groupIndexPath = addGroup.tableView.indexPathForSelectedRow,
              
              !myGroups.contains(addGroup.groups[groupIndexPath.item])
        else { return }
        let key = addGroup.groupSectionTitles[groupIndexPath.section]
        let value = addGroup.groupDictionary[key]
        ib = addGroup.groups
        myGroups.append(value?[groupIndexPath.row] ?? AllGroups(name: "eto govnokod", image: UIImage(), status: false))
        filterGroups = myGroups
        tableView.reloadData()
      
        
    }
    
    //MARK: Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyGroupsCell", bundle: nil),
                           forCellReuseIdentifier: "myGroupsCell")
        
        filterGroups = myGroups
        searchBar.delegate = self
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        filterGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as? MyGroupsCell
        else{
           return UITableViewCell()
        }

        let currentGroup = filterGroups[indexPath.row]
        
        cell.configure(image: currentGroup.image ?? UIImage(), name: currentGroup.name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        //performSegue(withIdentifier: "addGroup", sender: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            filterGroups = myGroups
            tableView.deleteRows(at: [indexPath], with: .fade)
           
        }     
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showAllGroups",
            let destinationVC = segue.destination as? AllGroupsTableVC
        else { return }
        destinationVC.userGroups = myGroups
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterGroups = []
        
        if searchText == "" {
            filterGroups = myGroups
        } else {
        for name in myGroups {
            if name.name.lowercased().contains(searchText.lowercased()) {
                filterGroups.append(name)
            }
        }
        }
        self.tableView.reloadData()
    }
    
}
