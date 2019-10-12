//
//  APITwitterDelegate.swift
//  Tweet
//
//  Created by Harmun Rossouw on 2019/10/11.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: AnyObject {
    init()
    
    func listen(tweet: [Tweet])
    func exception(err: NSError)
}

extension APITwitterDelegate {
    init() {
        self.init()
    }
}
