//
//  Extensions.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static let loadingViewTag = 1938123987
    func showLoading() {
        var loading = UIActivityIndicatorView(style: .medium)

        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.startAnimating()
        loading.hidesWhenStopped = true
        loading.tag = UIView.loadingViewTag
        addSubview(loading)
      loading.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loading.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func stopLoading() {
        let loading = UIActivityIndicatorView()
        loading.stopAnimating()
        loading.removeFromSuperview()
    }
}
