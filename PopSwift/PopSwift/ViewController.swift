//
//  ViewController.swift
//  PopSwift
//
//  Created by phoenix on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PopCustomViewDelegate {

    private let pop = PopBaseView()

//    private var cls: DelegateCls? = DelegateCls()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showPopView(_ sender: UIButton) {
        let customView = PopCustomView()
        customView.delegate = self
        pop.showFrom(sender: sender, customPopView: customView, popDiection: .bottomRight)
        pop.showCustomViewFromBottomRight { () -> (CGSize) in
            return CGSize(width: 142, height: 177 + 12)
        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) { [weak self] in
//            print(self?.class)
//            self?.cls = nil
//            print("\(self?.cls)")
//        }
    }
    @IBAction func dissmiss(_ sender: Any) {
        pop.dismiss()
    }
    // MARK: -delegate
    func selectedPopItemIndex(index: Int) {
        print("selected index: \(index)")
    }

    deinit {
        print("asdfasdf_dealloc")
    }
}

class DelegateCls: PopCustomViewDelegate {
    // MARK: -delegate
    func selectedPopItemIndex(index: Int) {
        print(self)
        print("selected index cls: \(index)")
    }

    deinit {
        print("asdfasdfasdfa_dealloc")
    }
}

