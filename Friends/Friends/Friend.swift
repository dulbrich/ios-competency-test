//
//  File.swift
//  Friends
//
//  Created by David Ulbrich on 8/3/17.
//  Copyright © 2017 David Ulbrich. All rights reserved.
//

import Foundation
import Retrolux

class Friend: Reflection {
    var id = 0
    var img = ""
    var first_name = ""
    var last_name = ""
    var phone = ""
    var address_1 = ""
    var city = ""
    var state = ""
    var zipcode = ""
    var bio = ""
    var photos = [String]()
    var available = false
}
