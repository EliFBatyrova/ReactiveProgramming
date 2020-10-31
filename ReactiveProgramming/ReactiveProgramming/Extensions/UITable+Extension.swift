//
//  UITable+Extension.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
}

extension UITableViewCell {
    static var identifier: String { String(describing: self) }
}
