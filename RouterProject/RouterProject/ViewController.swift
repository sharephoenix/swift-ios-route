//
//  ViewController.swift
//  RouterProject
//
//  Created by Alexluan on 2018/12/2.
//  Copyright © 2018年 Alexluan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let arr = ["abc","bbd","abc","bbd"]
        let index = arr.findIndex(item: "BBd")
        print("asdf")
    }

    @IBAction func routePushUIAction(_ sender: Any) {
        Router.openController(className: "RouteFirstController", params: ["nickName":"alexluan","address":"shanghai"])
    }
    
    @IBAction func routePushFromModuleId(_ sender: Any) {
        Router.openController(moduleId: 10002, params: ["nickName":"alexluan","address":"yunan"])
    }
    
    @IBAction func routePushFromUrl(_ sender: Any) {
        let routeUrl = "routeprotocol://routerproject:10002?nickName=alexluan&address=anhui"
//        let routeUrl = "http://www.baidu.com"
        Router.openUrl(url: routeUrl)
    }
}

