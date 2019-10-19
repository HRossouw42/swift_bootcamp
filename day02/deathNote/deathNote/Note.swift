//
//  Note.swift
//  deathNote
//
//  Created by Harmun Rossouw on 2019/10/19.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit
class Note {
    
    var name: String
    var description: String
    var date: String
    
    init?(name: String, description: String, date: String) {
        guard !name.isEmpty || !description.isEmpty else {
            return nil
        }

        self.name = name
        self.description = description
        self.date = date
    }
}
