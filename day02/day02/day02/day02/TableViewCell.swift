//
//  TableViewCell.swift
//  day02
//
//  Created by Harmun Rossouw on 2019/10/10.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

//    @IBOutlet weak var DeathName: UILabel!
//    @IBOutlet weak var DeathDescription: UILabel!
    
    @IBOutlet weak var DeathName: UILabel!
    
    @IBOutlet weak var DeathDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
