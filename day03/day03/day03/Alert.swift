//
//  Alert.swift
//  day03
//
//  Created by Harmun Rossouw on 2019/10/11.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

class AlertHelper {
    func showAlert(fromController controller: UIViewController) {
        var alert = UIAlertController(title: "abc", message: "def", preferredStyle: .Alert)
        controller.presentViewController(alert, animated: true, completion: nil)
    }
}
