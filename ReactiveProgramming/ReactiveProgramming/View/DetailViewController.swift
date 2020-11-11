//
//  DetailViewController.swift
//  ReactiveProgramming
//
//  Created by Евгений on 11.11.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var addToFriendsButton: UIButton!
    
    private let bag = DisposeBag()
    private let viewModel = DetailViewModel()
    private let analyticsManager: AnalyticsManager = AnalyticsManagerImpl()
    private var buttonClickCounter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: bag)
        viewModel.username.bind(to: usernameLabel.rx.text).disposed(by: bag)
        viewModel.city.bind(to: cityLabel.rx.text).disposed(by: bag)
        viewModel.email.bind(to: emailLabel.rx.text).disposed(by: bag)
        viewModel.companyName.bind(to: companyNameLabel.rx.text).disposed(by: bag)
        
        addToFriendsButton.rx.tap
            .bind {
                if self.buttonClickCounter == 3 {
                    fatalError("Too many pressings, chill")
                } else {
                    self.analyticsManager.reportEvent(with: "AddToFriendsButtonDidPress", parameters: nil)
                    self.buttonClickCounter += 1
                }
            }
            .disposed(by: bag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        analyticsManager.setUserProperty(name: self.nameLabel.text!)
        analyticsManager.reportEvent(with: "OpenedScreenWithDetailView", parameters: ["NameOfOpenedUser" : self.nameLabel.text!])
    }
    
    func configure(with user: UserDTO) {
        viewModel.configure(with: user)
    }
}
