//
//  FirstViewController.swift
//  day05
//
//  Created by Harmun Rossouw on 2019/10/14.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var locations: [String] = ["42", "WeThinkCode", "Google Office"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView(frame: CGRect.zero)
}
    
}

extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let locationTitle = locations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        
        cell.setCell(name: locationTitle)
        
        return cell
    }
    
    
}

