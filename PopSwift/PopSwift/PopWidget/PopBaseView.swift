//
//  PopBaseView.swift
//  PopSwift
//
//  Created by phoenix on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import SnapKit

class PopBaseView: UIView {

    private let parentView: UIView? = UIApplication.shared.keyWindow
    private var parentFrame: CGRect = CGRect.zero

    private let contentView: UIView = UIView()

    private var customView: UIView?

    private var senderView: UIView?
    private var senderFrame: CGRect = CGRect.zero
    private var senderCenter: CGPoint = CGPoint(x: 0, y: 0)

    internal func showFrom(sender: UIView, customPopView: UIView) {
        senderView = sender
        resetCustomView(customPopView)
        // 计算相应的参数
        caculateAllArea()
        // 添加基础的View
        setupUI()
    }

    // 传入自定义的popView
    private func resetCustomView(_ customView: UIView) {
        self.customView = customView
        contentView.addSubview(customView)
    }


    private func setupUI() {
        if let parentView = parentView, let customView = customView {
            parentView.addSubview(contentView)
            contentView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }

    private func caculateAllArea() {
        guard let currentSenderView = senderView, let currentParentView  = parentView else {
            return
        }
        let parentFrame = currentParentView.bounds
        let senderFrame:CGRect = currentSenderView.convert(currentSenderView.bounds, to: currentParentView)
        let senderCenter = CGPoint(x: senderFrame.midX, y: senderFrame.midY)

        let firstArea = (parentFrame.width - senderCenter.x) * senderCenter.y
        let secondArea = senderCenter.x * senderCenter.y
        let thirdArea = senderCenter.x * (parentFrame.width - senderCenter.y)
        let forthArea = (parentFrame.width - senderCenter.x) * (parentFrame.width - senderCenter.y)

        self.senderCenter = senderCenter
        self.parentFrame = parentFrame

        print("\(firstArea)-\(secondArea)-\(thirdArea)-\(forthArea)")
        // 如果第一象限 最大 布局在第一象限中
    }

    private func showToFirstArea() {
        if let customView = customView, let parentFrame = parentView{
            customView.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(senderFrame.minX)
                make.bottom.equalToSuperview().offset(parentView.frame.height - senderFrame)
            }
        }
    }

}
