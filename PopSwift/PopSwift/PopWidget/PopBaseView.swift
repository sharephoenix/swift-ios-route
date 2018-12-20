//
//  PopBaseView.swift
//  PopSwift
//
//  Created by phoenix on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import SnapKit

class PopBaseView: UIControl {

    enum PopDirectiom {
        case bottomRight
        case none
    }

    private lazy var parentView: UIView? = {
        let view = UIApplication.shared.keyWindow
        return view
    }()
    private var parentFrame: CGRect = CGRect.zero

    private var customView: UIView?

    private var senderView: UIView?

    private var popDiection: PopDirectiom = .none
    private var senderFrame: CGRect = CGRect.zero
    private var senderCenter: CGPoint = CGPoint(x: 0, y: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        addTarget(self, action: #selector(dismiss), for: UIControl.Event.touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func showFrom(sender: UIView, customPopView: UIView, popDiection: PopDirectiom) {
        self.popDiection = popDiection
        if popDiection == .none || parentView == nil { return }
        senderView = sender
        self.customView = customPopView
        caculateAllArea()
    }

    private func setupUI() {
        if let parentView = parentView, let customView = customView {
            parentView.addSubview(self)
            self.addSubview(customView)
            self.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }

        }
    }

    internal func showCustomViewFromBottomRight(getSize: (() -> (CGSize))) {
        // 添加基础的View
        setupUI()
        switch self.popDiection {
        case .bottomRight:
            customView?.snp.remakeConstraints({ (make) in
                make.top.equalToSuperview().offset(senderFrame.maxY)
                let right = parentFrame.width - senderFrame.maxX
                make.trailing.equalToSuperview().offset(-(right))
                make.size.equalTo(getSize())
            })
        default:
            break
        }
    }

    @objc internal func dismiss() {
        self.removeFromSuperview()
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

        self.senderFrame = senderFrame
        self.senderCenter = senderCenter
        self.parentFrame = parentFrame

        print("\(firstArea)-\(secondArea)-\(thirdArea)-\(forthArea)")
        // 如果第一象限 最大 布局在第一象限中
    }
//
//    private func showToFirstArea() {
//        if let customView = customView, let parentFrame = parentView{
//            customView.snp.makeConstraints { (make) in
//                make.leading.equalToSuperview().offset(senderFrame.minX)
//                make.bottom.equalToSuperview().offset(parentView.frame.height - senderFrame)
//            }
//        }
//    }

}
