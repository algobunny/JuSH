//
//  MyActivitesViewController.swift
//  JuSH
//
//  Created by Alice Q Wong on 4/26/15.
//  Copyright (c) 2015 Alice Q Wong. All rights reserved.
//

import UIKit

let reuseIdentifierActivitiesUserAvatar = "myActCell"



class MyActivitesViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
      //  self.collectionView!.registerClass(AvatarWithNameCell.self, forCellWithReuseIdentifier: reuseIdentifierActivitiesUserAvatar)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return myActsList.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return myActsList[section].interested.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : AvatarWithNameCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierActivitiesUserAvatar, forIndexPath: indexPath) as! AvatarWithNameCell
    
        var actInterestedParties = myActsList[indexPath.section].interested
        cell.imgUserAvatar?.image = UIImage(named: "user_" + actInterestedParties[indexPath.item].first_name)
        cell.labelUserName?.text = actInterestedParties[indexPath.item].first_name
        
   /*     let userAvatarSource = UIImage(named: "user_" + actInterestedParties[indexPath.item].first_name)
        var userAvatar = UIImageView(image: userAvatarSource)
        userAvatar.bounds = cell.bounds
        cell.addSubview(userAvatar) */
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
      let sect = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "sectionHeader", forIndexPath: indexPath) as! ActivityHeaderCell
        
        sect.sectionTitle.text = myActsList[indexPath.section].description
        
        return sect
    }
    /*
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedUser = myActsList[indexPath.section].interested[indexPath.item]
          performSegueWithIdentifier("plans2profile", sender: self)
    }*/

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
        performSegueWithIdentifier("plans2profile", sender: self)
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "plans2profile"){
            let profileView : OthersProfileViewController = segue.destinationViewController as! OthersProfileViewController
            
            let cell : AvatarWithNameCell = sender as! AvatarWithNameCell
            let ind = self.collectionView?.indexPathForCell(cell)
            let  selectedUser = myActsList[ind!.section].interested[ind!.item]
            
            profileView.showUser = selectedUser
        }
    }
    
    
}
