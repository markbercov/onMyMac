//
//  MyFriendsTableVC.swift
//  VK Client
//
//  Created by mark berkov on 21.12.21.
//

import UIKit

final class MyFriendsTableVC: UITableViewController, UISearchBarDelegate {
    //MARK: Lifecicle
    
    
    @IBOutlet var searchBar: UISearchBar!
    
    var filterFriend = [Friend]()
    var aaa = MyFriendsCell()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyFriendsCell", bundle: nil),
                           forCellReuseIdentifier: "myFriendsCell")
        
        filterFriend = allFriend
        searchBar.delegate = self
        
     

    }
    
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterFriend.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell", for: indexPath) as? MyFriendsCell
        else {
            return UITableViewCell()
        }
        let currentFriend = filterFriend[indexPath.row]
        
        cell.configure(image: currentFriend.image ?? UIImage(), name: currentFriend.name)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allFriend.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        performSegue(withIdentifier: "showProfile", sender: nil)
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showProfile",
            let destination = segue.destination as? FriendProfileCollectionVC,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        destination.friend = allFriend[index]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterFriend = []
        
        if searchText == "" {
            filterFriend = allFriend
        } else {
        for name in allFriend {
            if name.name.lowercased().contains(searchText.lowercased()) {
                filterFriend.append(name)
            }
        }
        }
        self.tableView.reloadData()
    }
   
    

}
