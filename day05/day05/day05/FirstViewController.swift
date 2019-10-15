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
    
    var locations: [String] = ["42", "WeThinkCode Johannesburg", "WeThinkCode Cape Town"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! SecondViewController
            destVC.location = sender as? Cell
        }
    }
    
    func goToView(row: Int) {
          tabBarController?.selectedIndex = row
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
    
    //on selecting a cell
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = locations[indexPath.row]
//        //performSegue(withIdentifier: "MasterToDetail", sender: cell)
//        prepare(for: UIStoryboardSegue, sender: cell)
//        //let destinationCell = SecondViewController.setUI()
//        tabBarController?.selectedIndex = 1
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadMapViewScreen(index: indexPath.row)
        print (indexPath.row)
    }

    func loadMapViewScreen(index: Int) {
        let secondTab = self.tabBarController?.viewControllers![1] as! SecondViewController
        secondTab.initialLoc = index
        goToView(row: 1)
    }
    
    
}

