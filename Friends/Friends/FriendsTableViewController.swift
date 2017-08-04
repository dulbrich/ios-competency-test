//
//  ViewController.swift
//  Friends
//
//  Created by David Ulbrich on 8/3/17.
//  Copyright © 2017 David Ulbrich. All rights reserved.
//

import UIKit
import Retrolux

class FriendsTableViewController: UITableViewController{

    let apiEndPoint = "https://private-c1b9f-t2mobile.apiary-mock.com/"
    var friends: [Friends] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.getFriendsList(setFriendsList: setFriendsList)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        cell.friendFullName.text = "\(friend.first_name) \(friend.last_name)"
        cell.friendStatus.text = "\(friend.status)"
        makeFriendImageRound(cell: cell)
        getFriendImage(imageUrl: friend.img, cell: cell)
        if !friend.available {
            cell.availableImage.image = UIImage(named: "notAvailable.jpg")
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            friendId = friends[selectedRow].id
        }
    }
    
    func makeFriendImageRound(cell: FriendTableViewCell) {
        cell.friendImage.layer.borderWidth = 1;
        cell.friendImage.layer.masksToBounds = false
        cell.friendImage.layer.borderColor = UIColor.black.cgColor
        cell.friendImage.layer.cornerRadius = cell.friendImage.frame.height/2
        cell.friendImage.clipsToBounds = true
    }
    
    
    func setFriendsList(friendsList: [Friends]) {
        print("Got \(self.friends.count) friends!")
        self.friends = friendsList
        self.tableView.reloadData()
    }
    
    
    func getFriendImage(imageUrl: String, cell: FriendTableViewCell) {
        let friendImageUrl = URL(string: imageUrl)
        let session = URLSession(configuration: .default)
        let downloadPicture = session.dataTask(with: friendImageUrl!) { (data, response, error) in
            if let err = error {
                print("Error downloading cat picture: \(err)")
            } else {
                if let resp = response as? HTTPURLResponse {
                    print("Downloaded restaurant image with response code \(resp.statusCode)")
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        cell.friendImage.image = image
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicture.resume()
    }

}

