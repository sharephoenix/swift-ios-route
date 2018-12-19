//
//  PopCustomView.swift
//  PopSwift
//
//  Created by phoenix on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class PopCustomView: UIView {

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 8
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func loadUI() {
        addSubview(praiseButton)
        addSubview(commentButton)
        addSubview(distanceFromCurrentButton)
        addSubview(distanceFromLongButton)
        praiseButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
        }
        commentButton.snp.makeConstraints { (make) in
            make.top.equalTo(praiseButton.snp.bottom).offset(30)
        }
        distanceFromCurrentButton.snp.makeConstraints { (make) in
            make.top.equalTo(commentButton.snp.bottom).offset(30)
        }
    }

    // MARK: Preproty
    private let praiseButton: PopItem = {
        let popItem = PopItem()

        return popItem
    }()
    private let commentButton: PopItem = {
        let popItem = PopItem()

        return popItem
    }()
    private let distanceFromLongButton: PopItem = {
        let popItem = PopItem()

        return popItem
    }()
    private let distanceFromCurrentButton: PopItem = {
        let popItem = PopItem()

        return popItem
    }()

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
        let horizonal = rect.width - 30
        context?.move(to: CGPoint(x: 12 + horizonal, y: 0))
        context?.addLine(to: CGPoint(x: 0 + horizonal, y:12))
        context?.addLine(to: CGPoint(x: 24 + horizonal, y: 12))
        context?.closePath()
        context?.drawPath(using: .fill)
        context?.strokePath()
    }
}

class PopItem: UIButton {

}
