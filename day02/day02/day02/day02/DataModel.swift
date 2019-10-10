//
//  DataModel.swift
//  day02
//
//  Created by Harmun Rossouw on 2019/10/10.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class DataModel: NSObject {
    var deathName: String?
    var deathDescription: String?
    
    init(deathName: String?, deathDescription: String?){
        self.deathName = deathName
        self.deathDescription = deathDescription
    }

}
