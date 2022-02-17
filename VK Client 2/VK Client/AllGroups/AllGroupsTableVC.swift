//
//  AllGroupsTableVC.swift
//  VK Client
//
//  Created by mark berkov on 21.12.21.
//

import UIKit


final class AllGroupsTableVC: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var groupDictionary = [String: [AllGroups]]()
    var groupSectionTitles = [String]()
    
    var groups = [AllGroups]()
    
    var allGroups = [
        AllGroups(name: "Japan girls", image: UIImage(named: "2"), status: false),
        AllGroups(name: "Timon", image: UIImage(named: "3"), status: false),
        AllGroups(name: "Abc", image: nil, status: false),
        AllGroups(name: "vostok", image: UIImage(systemName: "pencil"), status: false),
        AllGroups(name: "zapad", image: UIImage(systemName: "pencil"), status: false),
        AllGroups(name: "sosiska v teste", image: UIImage(systemName: "lasso"), status: false),
        AllGroups(name: "pyaterochka", image: UIImage(systemName: "square.and.arrow.up"), status: false),
        AllGroups(name: "Abc again", image: UIImage(systemName: "square.and.arrow.up"), status: false),
        AllGroups(name: "voda like water", image: UIImage(systemName: "pencil"), status: false)
    ]
    
    
    var userGroups = [AllGroups]()
    
    //MARK: Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AllGroupsCell", bundle: nil),
                           forCellReuseIdentifier: "allGroupsCell")
        
        groups = allGroups
        
        searchBar.delegate = self
        
        addMass()
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        return groupSectionTitles.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let groupKey = groupSectionTitles[section]
        if let groupValues = groupDictionary[groupKey] {
            return groupValues.count
        }
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsCell", for: indexPath) as? AllGroupsCell
        else {
            return UITableViewCell()
        }
        
        let groupKey = groupSectionTitles[indexPath.section]
        if let carValues = groupDictionary[groupKey] {
            cell.configure(image: carValues[indexPath.row].image ?? UIImage(), name: carValues[indexPath.row].name, status: userGroups.contains(carValues[indexPath.row]))
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return groupSectionTitles
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        groups = []
        
        if searchText == "" {
            groups = allGroups
        } else {
            for name in allGroups {
                if name.name.lowercased().contains(searchText.lowercased()) {
                    groups.append(name)
                    
                }
            }
        }
        addMass()
        self.tableView.reloadData()
    }
    
    private func addMass() {
        groupDictionary = [ : ]
        groupSectionTitles = []
        
        for group in groups {
            let groupKey = String(group.name.prefix(1))
            if var groupValue = groupDictionary[groupKey] {
                groupValue.append(group)
                groupDictionary[groupKey] = groupValue
                
            } else {
                groupDictionary[groupKey] = [group]
            }
        }
        groupSectionTitles = [String](groupDictionary.keys)
        groupSectionTitles = groupSectionTitles.sorted(by: { $0 < $1 })
        
    }
}
