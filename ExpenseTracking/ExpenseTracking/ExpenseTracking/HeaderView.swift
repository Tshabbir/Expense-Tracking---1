//
//  HeaderView.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 06/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import UIKit

protocol HeaderDelegate {
    func callHeader(index: Int)
}

class HeaderView: UIView {
    
    var secIndex: Int?
    var delegate: HeaderDelegate?
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(btn)
    }

    required init?(coder: NSCoder) {
        fatalError("initCoder:  has not been implemented")
    }
    lazy var btn: UIButton = {
    let btn = UIButton(frame: CGRect(x: self.frame.origin.x,
    y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
    btn.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    btn.titleLabel?.textColor = UIColor.black
    btn.layer.cornerRadius = 10
    btn.clipsToBounds = true
    btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        return btn
    }()
    
    @objc func onClickHeaderView() {
        if let index = secIndex {
            delegate?.callHeader(index: index)
        }
    }

}
