//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by David Ulbrich on 8/3/17.
//  Copyright © 2017 David Ulbrich. All rights reserved.
//

import Foundation
import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendFullName: UILabel!
    @IBOutlet weak var friendStatus: UILabel!
    @IBOutlet weak var availableImage: UIImageView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
