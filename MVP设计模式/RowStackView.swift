//
//  RowStackView.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/28.
//

import UIKit

class RowStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ColumnStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
