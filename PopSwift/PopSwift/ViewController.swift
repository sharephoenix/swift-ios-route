//
//  ViewController.swift
//  PopSwift
//
//  Created by phoenix on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let pop = PopBaseView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func showPopView(_ sender: UIButton) {
        let customView = PopCustomView()
        pop.showFrom(sender: sender, customPopView: customView as! UIView, popDiection: .bottomRight)
        pop.showCustomViewFromBottomRight()
    }
    @IBAction func dissmiss(_ sender: Any) {
        pop.dismiss()
    }
}

