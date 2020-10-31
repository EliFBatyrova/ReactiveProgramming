//
//  UIStackView+Extension.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], spacing: CGFloat, distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
    }
}
