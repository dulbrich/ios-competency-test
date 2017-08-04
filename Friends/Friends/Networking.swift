//
//  Networking.swift
//  Friends
//
//  Created by David Ulbrich on 8/4/17.
//  Copyright © 2017 David Ulbrich. All rights reserved.
//

import Foundation
import Retrolux

class Networking {
    
    let friendsListEndPoint = "https://private-c1b9f-t2mobile.apiary-mock.com/"
    let friendEndPoint = "https://private-c1b9f-t2mobile.apiary-mock.com/friends/"
    
    func getFriendsList(setFriendsList: @escaping ([Friends]) -> ()) {
        let builder = Builder(base: URL(string: friendsListEndPoint)!)
        let getFriends = builder.makeRequest(
            method: .get,
            endpoint: "friends",
            args: (),
            response: [Friends].self)
        getFriends().enqueue { response in
            switch response.interpreted {
            case .success(let friendsList):
                setFriendsList(friendsList)
            case .failure(let error):
                print("Failed to get friends: \(error)")
            }
        }
    }
    
    func getFriend(setFriend: @escaping (Friend) -> ()) {
        let builder = Builder(base: URL(string: friendEndPoint)!)
        let getFriend = builder.makeRequest(
            method: .get,
            endpoint: "\(friendId)",
            args: (),
            response: Friend.self)
        getFriend().enqueue { response in
            switch response.interpreted {
            case .success(let friend):
                setFriend(friend)
            case .failure(let error):
                print("Failed to get friend \(friendId): \(error)")
            }
        }
    }
    
}

//global network
let network = Networking()
