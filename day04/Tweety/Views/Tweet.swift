//
//  tweet.swift
//  Tweet
//
//  Created by Harmun Rossouwon 2019/10/11.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    let name: String
    let tweet: String
    let date: String
    
    var description: String {
        return "Tweet: \(name), \(tweet), \(date)"
    }
}
