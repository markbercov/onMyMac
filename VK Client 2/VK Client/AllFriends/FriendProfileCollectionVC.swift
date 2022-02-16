//
//  AllPeopleCollectionVC.swift
//  VK Client
//
//  Created by mark berkov on 7.01.22.
//

import UIKit

final class FriendProfileCollectionVC: UICollectionViewController {

    var friend: Friend?
    
       
 
    // MARK: LIFECICLE
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "FriendProfileCollectionCell", bundle: nil), forCellWithReuseIdentifier: "friendProfileCollectionCell")


    }

    


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return friend?.photoImages.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendProfileCollectionCell", for: indexPath) as? FriendProfileCollectionCell,
            let friend = friend
        else {  return UICollectionViewCell() }
        
        
        cell.configure(image: friend.photoImages[indexPath.item],
                       bot: friend.name)
        
       
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        performSegue(withIdentifier: "toFoto", sender: index)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "toFoto",
            let destinationController = segue.destination as? FullScreenFotoVC,
            let indP = self.collectionView.indexPathsForSelectedItems?.first
        else { return }
        destinationController.index = indP.item
        destinationController.fotos = friend
        
    }
    
      }

