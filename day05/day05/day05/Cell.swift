//
//  Cell.swift
//  day05
//
//  Created by Harmun Rossouw on 2019/10/14.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var cellName: UILabel!
    
    var name: String? = ""
    var coord: String? = ""
    
    override var description: String {
        return "Cell: \(String(describing: self.cellName.text))"
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func setCell(name : String) {
        cellName.text = name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
