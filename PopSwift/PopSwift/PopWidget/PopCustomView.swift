//
//  PopCustomView.swift
//  PopSwift
//
//  Created by phoenix on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

protocol PopCustomViewDelegate: class {
    func selectedPopItemIndex(index: Int)
}

class PopCustomView: UIView {

    weak var delegate: PopCustomViewDelegate?

    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        loadUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func loadUI() {
        self.addSubview(contentView)
        contentView.addSubview(praiseButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(bounceFromNearButton)
        contentView.addSubview(bounceFromFarButton)
        contentView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(12)
        }
        praiseButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22.5)
            make.height.equalTo(44)
        }
        commentButton.snp.makeConstraints { (make) in
            make.top.equalTo(praiseButton.snp.bottom)
            make.leading.equalToSuperview().offset(22.5)
            make.height.equalTo(44)
        }
        bounceFromNearButton.snp.makeConstraints { (make) in
            make.top.equalTo(commentButton.snp.bottom)
            make.leading.equalToSuperview().offset(22.5)
            make.height.equalTo(44)
        }
        bounceFromFarButton.snp.makeConstraints { (make) in
            make.top.equalTo(bounceFromNearButton.snp.bottom)
            make.leading.equalToSuperview().offset(22.5)
            make.height.equalTo(44)
        }

        for i in 0..<3 {
            let lineView = UIView()
            lineView.backgroundColor = .groupTableViewBackground
            addSubview(lineView)
            var referenceView: UIView?
            if i == 0 {
                referenceView = praiseButton
            }
            if i == 1 {
                referenceView = commentButton
            }
            if i == 2 {
                referenceView = bounceFromNearButton
            }
            if let referenceView = referenceView {
                lineView.snp.makeConstraints { (make) in
                    make.top.equalTo(referenceView.snp.bottom).offset(0)
                    make.leading.equalToSuperview().offset(12)
                    make.trailing.equalToSuperview().offset(-12)
                    make.height.equalTo(1)
                }
            }
        }
    }

    // MARK: UI_ACIOTN
    @objc private func praiseAction() {
        delegate?.selectedPopItemIndex(index: 0)
    }

    @objc private func commentAction() {
        delegate?.selectedPopItemIndex(index: 1)
    }

    @objc private func bounceFromFar() {
        delegate?.selectedPopItemIndex(index: 2)
    }

    @objc private func bounceFromNear() {
        delegate?.selectedPopItemIndex(index: 3)
    }
    // MARK: Preproty
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private lazy var praiseButton: PopItem = {
        let popItem = PopItem()
        popItem.setImage(UIImage.init(named: "ic_oliver_bounced_Thumb_up"), for: .normal)
        popItem.setTitle("点赞数", for: .normal)
        popItem.setTitleColor(.black, for: .normal)
        popItem.addTarget(self, action: #selector(praiseAction), for: .touchUpInside)
        return popItem
    }()

    private let commentButton: PopItem = {
        let popItem = PopItem()
        popItem.setTitle("评论数", for: .normal)
        popItem.setImage(UIImage.init(named: "ic_oliver_bounced_comments"), for: .normal)
        popItem.setTitleColor(.black, for: .normal)
        popItem.addTarget(self, action: #selector(commentAction), for: .touchUpInside)
        return popItem
    }()

    private let bounceFromFarButton: PopItem = {
        let popItem = PopItem()
        popItem.setTitle("日期近到远", for: .normal)
        popItem.setTitleColor(.black, for: .normal)
        popItem.setImage(UIImage.init(named: "ic_oliver_bounced_nearly"), for: .normal)
        popItem.addTarget(self, action: #selector(bounceFromFar), for: .touchUpInside)
        return popItem
    }()

    private let bounceFromNearButton: PopItem = {
        let popItem = PopItem()
        popItem.setTitle("日期远到近", for: .normal)
        popItem.setTitleColor(.black, for: .normal)
        popItem.setImage(UIImage.init(named: "ic_oliver_bounced_far"), for: .normal)
        popItem.addTarget(self, action: #selector(bounceFromNear), for: .touchUpInside)
        return popItem
    }()

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
        let horizonal = rect.width - 24
        context?.move(to: CGPoint(x: horizonal, y: 6))
        context?.addLine(to: CGPoint(x: horizonal - 8, y: 12))
        context?.addLine(to: CGPoint(x: horizonal + 8, y: 12))
        context?.closePath()
        context?.drawPath(using: .fill)
        context?.strokePath()
    }
}

class PopItem: UIButton {

}
