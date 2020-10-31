//
//  UILabel+Extension.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import UIKit

extension UILabel {
    
    convenience init(font: UIFont = UIFont.systemFont(ofSize: 15), textColor: UIColor) {
        self.init()
        
        self.font = font
        self.textColor = textColor
    }
}
