//
//  FriendsViewController.swift
//  Friends
//
//  Created by David Ulbrich on 8/3/17.
//  Copyright © 2017 David Ulbrich. All rights reserved.
//

import Foundation
import UIKit
import Retrolux

var friendId = 0

class FriendViewController: UIViewController {
    
    
    @IBOutlet weak var friendFullName: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendBio: UILabel!
    @IBOutlet weak var friendPhone: UITextView!
    @IBOutlet weak var friendAvailability: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.getFriend(setFriend: setFriend)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    func setFriend(friend: Friend) {
        self.friendFullName.text = "\(friend.first_name) \(friend.last_name)"
        self.friendBio.text = friend.bio
        self.friendPhone.text = friend.phone
        if friend.available {
            self.friendAvailability.text = "AVAILALBE"
        } else {
            self.friendAvailability.text = "NOT AVAILABLE"
        }
        self.getFriendImage(imageUrl: friend.img)
    }
    
    func getFriendImage(imageUrl: String) {
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
                        self.friendImage.image = image
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
